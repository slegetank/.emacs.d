;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; 加载配置orgmode文件
(mapc 'org-babel-load-file (directory-files (expand-file-name "init" user-emacs-directory) t "\\.org$"))

(find-file "~/.emacs.d/initpage.org")
