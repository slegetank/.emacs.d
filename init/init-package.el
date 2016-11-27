
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
       ("melpa" . "http://elpa.zilongshanren.com/melpa/"))))

(setq package-selected-packages '(
           company
           hungry-delete
           monokai-theme
           swiper
           counsel
           smartparens
           evil
           exec-path-from-shell
           popwin
           reveal-in-osx-finder
           iedit
           helm-ag
           slime

           ))

(require 'cl-lib)
(defun slegtank/check-installed-packages ()
  (cl-loop for pkg in package-selected-packages
  when (not (package-installed-p pkg)) do (cl-return nil)
  finally (cl-return t)))

(unless (slegtank/check-installed-packages)
  (message "%s" "Some packages missed, refreshing...")
  (package-refresh-contents)
  (dolist (pkg package-selected-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-company-mode t) ; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous))

(load-theme 'monokai t) ; theme

(global-hungry-delete-mode t) ; hungry delete

(evil-mode t) ; vim

(smartparens-global-mode t) ; smart paren

;; popwin
(require 'popwin)
(popwin-mode t)

;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "C-c o") 'reveal-in-osx-finder)

(global-set-key (kbd "C-c e") 'iedit-mode)

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
 (setq slime-contribs '(slime-fancy))
