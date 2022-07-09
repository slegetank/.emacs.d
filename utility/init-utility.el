;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; source point to China
 (when (>= emacs-major-version 24)
   (setq package-archives '(
                            ("melpa"   . "http://1.15.88.122/melpa/")
                            ("gnu"   . "http://1.15.88.122/gnu/")
                           ;;("org" . "http://orgmode.org/elpa/") ;; org mode的elpa总是不稳定
                            )))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
;; get from https://github.com/purcell/emacs.d/blob/master/init.el
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold (* 50 1024 1024))))

;; 手动下org mode
 (let ((default-directory  "~/org-mode/"))
   (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path (expand-file-name "extra-packages" user-emacs-directory))

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

(require-package 'gnu-elpa-keyring-update)

;; use-package
(require-package 'use-package)

(defun slegetank/time-subtract-millis (b a)
  ""
  (* 1000.0 (float-time (time-subtract b a))))

(defun slegetank/dump-var-to-file (var filepath)
  "Dump var to file."
  (save-excursion
    (let ((buf (find-file-noselect filepath)))
      (set-buffer buf)
      (erase-buffer)
      (prin1 var buf)
      (save-buffer)
      (kill-buffer))))

(defun slegetank/read-var-from-file (filePath)
  "Read var from file."
  (if (file-exists-p filePath)
      (read (with-temp-buffer
              (insert-file-contents filePath)
              (buffer-string)))
    '()))

(provide 'init-utility)
