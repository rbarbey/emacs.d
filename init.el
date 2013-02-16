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

;; JSON mode
(add-to-list 'load-path "~/.emacs.d/json-mode")
(require 'json-mode)

;; button-lock
(add-to-list 'load-path "~/.emacs.d/button-lock")

;; Acrolog mode
(add-to-list 'load-path "~/.emacs.d/acrolog-mode")
(require 'acrolog-mode)

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

(defun duplicate-line ()
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
