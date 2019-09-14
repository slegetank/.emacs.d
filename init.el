(setq load-path (cons (expand-file-name "utility" user-emacs-directory) load-path))
(require 'init-utility)

;; 暂时去掉
(require-package 'org-plus-contrib)

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; 默认配置
(org-babel-load-file (expand-file-name "init/init-defaults.org" user-emacs-directory))

;; 要加载的配置文件
(setq slegetank/init-load-files '("custom"
                                  "evil"
                                  "UI"
                                  "window"
                                  "mark"
                                  "package"
                                  "tools"
                                  "org"
                                  "company"
                                  "ivy"
                                  "search"
                                  "blog"
                                  "python"
                                  "dired"
                                  "js"
                                  "git"
                                  "project"
                                  "help"
                                  "eshell"
                                  "chinese"
                                  "linkplay"
                                  "commonlisp"
                                  "ibuffer"
                                  "whitespace"
                                  "regex"
                                  "minibuffer"
                                  "promela"
                                  ))

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
;; (eshell)
;; (rename-buffer "*eshell: ~ <1>*")
(evil-normal-state)

;; (find-file "~/.emacs.d/initpage.org")
(put 'upcase-region 'disabled nil)

(put 'erase-buffer 'disabled nil)
(put 'set-goal-column 'disabled nil)
