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

;; node.js mode
(add-to-list 'load-path "~/.emacs.d/nodejs-mode")
(require 'nodejs-mode)

;; CoffeeScript mode
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode)

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

(defun ska-untabify ()
  "My untabify function as discussed and described at
http://www.jwz.org/doc/tabs-vs-spaces.html
and improved by Claus Brunzema:
 - return nil to get `write-contents-hooks' to work correctly
   (see documentation there)
 - `make-local-hook' instead of `make-local-variable'
 - when instead of if
Use some lines along the following for getting this to work in the
modes you want it to:
 
\(add-hook 'some-mode-hook  
          '(lambda () 
              (make-local-hook 'write-contents-hooks) 
               (add-hook 'write-contents-hooks 'ska-untabify nil t)))"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (when (search-forward "\t" nil t)
      (untabify (1- (point)) (point-max)))
    nil))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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


;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iswitchb-mode t)
 '(large-file-warning-threshold 100000000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
