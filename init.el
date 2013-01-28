;; Clojure mode
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(require 'clojure-mode)

;; nREPL
(add-to-list 'load-path "~/.emacs.d/nrepl.el")
(require 'nrepl)

;; Markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(require 'markdown-mode)
(setq auto-mode-alist
      (cons '("\\.md$" . markdown-mode)
	        auto-mode-alist))

(defun duplicate-line()
	(interactive)
	(move-beginning-of-line 1)
	(kill-line)
	(yank)
	(open-line 1)
	(next-line 1)
	(yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)

(custom-set-variables
	'(large-file-warning-threshold 100000000))
