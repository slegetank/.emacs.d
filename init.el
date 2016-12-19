;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/init/")

;; 加载配置orgmode文件
(org-babel-load-file (expand-file-name "init/init-defaults.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-package.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-org.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-elisp.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-python.org" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("42ba25fad91db26bfa0130161412d49804ff27e6a09bf45f1a8268511300d981" "3b333a6780005b5dbfd1b15525118fe37791387b994008c977c786cd9b464977" "51897d0e185a9d350a124afac8d5e95cda53e737f3b33befc44ab02f2b03dab1" default)))
 '(evil-leader/leader "SPC"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(find-file "~/.emacs.d/initpage.org")
