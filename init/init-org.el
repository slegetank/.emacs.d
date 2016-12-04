
(require 'org)
(setq org-src-fontify-natively t)

;; For editing source code
(defun custom-indent-org-block-automatically ()
  (interactive)
  (when (org-in-src-block-p)
    (org-edit-special)
    (indent-region (point-min) (point-max))
    (org-edit-src-exit)))

(evil-leader/set-key-for-mode 'org-mode 
  "ee" 'org-edit-special
  "==" 'custom-indent-org-block-automatically)

;; If src come from org mode, use these functions
(defun custom-org-edit-src-exit ()
  (interactive)
  (when (equal org-edit-src-from-org-mode 'org-mode)
    (org-edit-src-exit)))

(defun custom-org-edit-src-save ()
  (interactive)
  (when (equal org-edit-src-from-org-mode 'org-mode)
    (org-edit-src-save)))

(defun custom-save-buffer ()
  (interactive)
  (if (equal org-edit-src-from-org-mode 'org-mode)
      (org-edit-src-save)
    (save-buffer)))

(global-set-key (kbd "M-s") 'custom-save-buffer)

(evil-leader/set-key
  "eq" 'custom-org-edit-src-exit
  "es" 'custom-org-edit-src-save)

(defun my-org-config ()
  (local-set-key (kbd "s-k") 'outline-previous-visible-heading)
  (local-set-key (kbd "s-j") 'outline-next-visible-heading)
  )

(add-hook 'org-mode-hook 'my-org-config)
