import biplist
import sys
import os
import re

retArray = []

if sys.platform == "darwin":
    source = biplist.readPlist(os.path.expanduser("~/Library/Preferences/com.apple.finder.plist"))
    recentDirs = source.get("FXRecentFolders", None)

    if recentDirs:
        for dic in recentDirs:
            baseName = dic["name"]

            file_bookmark = dic["file-bookmark"].decode("utf-8", "ignore")
            if not file_bookmark:
                continue

            path = re.search(r"(?<=;)/.*?%s" % baseName, file_bookmark, re.I)
            if path:
                # retArray.append(path.group())
                print("%s" % path.group())



