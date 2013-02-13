;; allow users to run their code when this mode is run
(defvar acrolog-mode-hook nil)

;; define keymap, if few entries, change to 'make-sparse-keymap'
(defvar acrolog-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-r" 'next-check-request)
    map)
  "Keymap for Acrolinx Logfile major mode")

;; autoload
(add-to-list 'auto-mode-alist '("\\(coreserver\\|ls-[0-9]\\{2\\})\\.log\\'" . acrolog-mode))

;; '("^[0-9]\\\{4\\}/[0-9]\\{2\\}/[0-9]\\{2\\}" . font-lock-string-face)
;; syntax highlighting of log levels
(defconst acrolog-font-lock-log-levels
  (list
   '("\\[request [0-9]+\\]" . font-lock-keyword-face)
   '("\\(Language Server\\)? ls-[0-9]\\{2\\}-[a-f0-9]+" . font-lock-keyword-face)
   '("^[0-9]\\{4\\}/[0-9]\\{2\\}/[0-9]\\{2\\} [0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\}.[0-9]\\{3\\} |" . font-lock-preprocessor-face)
   '("Available memory.*$" . font-lock-doc-face)
   '("\\[\\(DEBUG\\|INFO \\)\\]" . font-lock-builtin-face)
   '("\\[\\(WARN \\|ERROR\\|FATAL\\|CRITICAL\\)\\]" . font-lock-warning-face)
   '("\\bat [.a-zA-Z():_0-9\\$]+$" . font-lock-warning-face)
   '("\\b[\\.a-zA-Z]+Exception" . font-lock-warning-face)
   )
  "Minimal highlighting expressions for Acrolinx Logfile mode")

;; 'main' function
(defun acrolog-mode ()
  "Major mode for Acrolinx Core and Language Server log files"
  (interactive)
  (kill-all-local-variables)
  (use-local-map acrolog-mode-map)
  
  (set (make-local-variable 'font-lock-defaults) '(acrolog-font-lock-log-levels))
  
  (setq major-mode 'acrolog-mode)
  (setq mode-name "Acrolog")
  (run-hooks 'acrolog-mode-hook))

(provide 'acrolog-mode)
