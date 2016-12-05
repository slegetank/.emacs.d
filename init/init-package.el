
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
       ("melpa" . "http://elpa.zilongshanren.com/melpa/"))))

(setq package-selected-packages '(
company
company-anaconda
hungry-delete
monokai-theme
swiper
counsel
smartparens
evil
evil-leader
evil-nerd-commenter
evil-surround
exec-path-from-shell
popwin
reveal-in-osx-finder
iedit
helm-ag
window-numbering
which-key
slime
elpy
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

(evil-mode t) ; vim

(require 'evil-leader)
(global-evil-leader-mode)
 (evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "wd" 'delete-other-windows
  "w-" 'split-window-horizontally
  "w/" 'split-window-vertically
  )

(evilnc-default-hotkeys)
(global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)

(require 'evil-surround)
(global-evil-surround-mode 1)

(global-company-mode t) ; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous))

(add-hook 'python-mode-hook 'anaconda-mode)
(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

(load-theme 'monokai t) ; theme

(global-hungry-delete-mode t) ; hungry delete

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

;;(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(window-numbering-mode 1)

(which-key-mode 1)
(setq which-key-side-window-max-height 0.25)

(elpy-enable)

(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
 (setq slime-contribs '(slime-fancy))
