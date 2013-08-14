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

;; Visual Basic Mode
(add-to-list 'load-path "~/.emacs.d/visual-basic-mode")
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ; VBscript
(add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))  ; visual basic .NET file
(add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode)) ; visual basic form
(add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode)) ; basic language source
(add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode)) ; C++ class definition file

;; open recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)

;; prerequisite for auto-complete
(add-to-list 'load-path "~/.emacs.d/popup-el")

;; Setting up Emacs as a Javascript editing environment for Fun or Profit
;; http://blog.deadpansincerity.com/2011/05/setting-up-emacs-as-a-javascript-editing-environment-for-fun-and-profit/

;; auto-complete mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

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

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


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
