;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; source point to China
(when (>= emacs-major-version 24)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                             ("melpa"   . "http://elpa.emacs-china.org/melpa/")
                             ;; ("org" . "http://orgmode.org/elpa/") ;; org mode的elpa总是不稳定
                             )))

(package-initialize)

;; 手动下org mode
(let ((default-directory  "~/org-mode/"))
  (normal-top-level-add-subdirs-to-load-path))

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

;; 暂时去掉
;; (require-package 'org-plus-contrib)

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; 默认配置
(org-babel-load-file (expand-file-name "init/init-defaults.org" user-emacs-directory))

;; 要加载的配置文件
(setq slegetank/init-load-files '("custom"
                                  "evil"
                                  "package"
                                  "tools"
                                  "org"
                                  "company"
                                  "search"
                                  "blog"
                                  "python"
                                  "js"
                                  "dired"
                                  "git"
                                  "project"
                                  "help"
                                  "UI"
                                  "eshell"
                                  "chinese"
                                  "linkplay"
                                  "commonlisp"))

;; mu4e
(when (executable-find "mu")
  (add-to-list 'slegetank/init-load-files "mu4e" t))

(let (orgpath)
  (dolist (item slegetank/init-load-files nil)
    (setq orgpath (expand-file-name (format "init/init-%s.org" item) user-emacs-directory))
    (when (file-exists-p orgpath)
      (org-babel-load-file orgpath))))

(setq custom-file (expand-file-name ".emacs-custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;; 加载theme的时候不提问
(setq custom-safe-themes t)

;; open eshell
(eshell)
(rename-buffer "*eshell: ~ <1>*")
(evil-normal-state)

;; (find-file "~/.emacs.d/initpage.org")
