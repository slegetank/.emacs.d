;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/init/")

;; 加载配置orgmode文件
(org-babel-load-file (expand-file-name "init/init-package.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "init/init-org.org" user-emacs-directory))

(setq make-backup-files nil)

;; elisp单引号不自动配对
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(defun firefox-get-frontmost-url ()
  (let ((result
	 (do-applescript
	  (concat
	   "set oldClipboard to the clipboard\n"
	   "set frontmostApplication to path to frontmost application\n"
	   "tell application \"Safari\"\n"
	   "	activate\n"
	   "	delay 0.15\n"
	   "	tell application \"System Events\"\n"
	   "		keystroke \"l\" using {command down}\n"
	   "		keystroke \"a\" using {command down}\n"
	   "		keystroke \"c\" using {command down}\n"
	   "	end tell\n"
	   "	delay 0.15\n"
	   "	set theUrl to the clipboard\n"
	   "	set the clipboard to oldClipboard\n"
	   "	set theResult to (get theUrl) & \"::split::\" & (get name of window 1)\n"
	   "end tell\n"
	   "activate application (frontmostApplication as text)\n"
	   "set links to {}\n"
	   "copy theResult to the end of links\n"
	   "return links as string\n"))))
    (car (split-string result "[\r\n]+" t))))

(defun interact-get-firefox-url ()
  (interactive)
  (print (firefox-get-frontmost-url)))

(global-set-key (kbd "C-c u") 'interact-get-firefox-url)

;; 高亮当前行
(global-hl-line-mode 1)

;; 选中删除
(delete-selection-mode 1)

;; 全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 140)

(setq ring-bell-function 'ignore)

;; 更好的滚动
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;; dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; C-c d打开当前文件的dired
(require 'dired-x)
(global-set-key (kbd "C-c d") 'dired-jump)

; ^ -> 上一级

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
