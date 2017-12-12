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

;; http://orgmode.org 下载org mode的源码
;; 配过在线安装的，但是并不好用
(add-to-list 'load-path "~/org-9.0.9/lisp/")
(add-to-list 'load-path "~/org-9.0.9/contrib/lisp/" t)

;; get from Purcell
;; 自动在线安装第三方包
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

;; use-package
(require-package 'use-package)
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; 默认配置
(org-babel-load-file (expand-file-name "init/init-defaults.org" user-emacs-directory))

;; 要加载的配置文件
(setq slegetank/init-load-files '("evil"
                                  "org"
                                  "search"
                                  "package"
                                  "blog"
                                  "elisp"
                                  "python"
                                  "js"
                                  "dired"
                                  "git"
                                  "project"
                                  "tools"
                                  "help"))

(when (executable-find "mu")
  (add-to-list 'slegetank/init-load-files "mu4e" t))

(dolist (item slegetank/init-load-files nil)
  (org-babel-load-file (expand-file-name (format "init/init-%s.org" item) user-emacs-directory)))

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
