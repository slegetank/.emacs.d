;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

;; source point to China
(when (>= emacs-major-version 24)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                             ("melpa"   . "http://elpa.emacs-china.org/melpa/")
                             )))

(add-to-list 'load-path "~/org-9.0.9/lisp/")
(add-to-list 'load-path "~/org-9.0.9/contrib/lisp/" t)

;; get from Purcell
(defun require-package (package &optional min-version no-refresh)
 "Install given PACKAGE, optionally requiring MIN-VERSION.
 If NO-REFRESH is non-nil, the available package lists will not be
 re-downloaded in order to locate PACKAGE."
 (add-to-list 'package-selected-packages package)
 (if (package-installed-p package min-version)
     t
   (if (or (assoc package package-archive-contents) no-refresh)
       (if (boundp 'package-selected-packages)
	   ;; Record this as a package the user installed explicitly
	   (package-install package nil)
	 (package-install package))
     (progn
       (package-refresh-contents)
       (require-package package min-version t)))))

;; 加载配置orgmode文件
(org-babel-load-file (expand-file-name "init/init-evil.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-org.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-package.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-defaults.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-blog.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-elisp.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-python.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-js.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-dired.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-mu4e.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-git.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-project.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-tools.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-help.org" user-emacs-directory))

;;(mapc 'org-babel-load-file (directory-files (expand-file-name "init" user-emacs-directory) t "\\.org$"))

;; (find-file "~/.emacs.d/initpage.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "17cda1304ba8d26d62bf247cab2c161d12957054b6be4477abb5972a74eea4e1" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "889a93331bc657c0f05a04b8665b78b3c94a12ca76771342cee27d6605abcd0e" default)))
 '(fci-rule-color "#0084C8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
