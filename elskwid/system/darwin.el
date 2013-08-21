;; darwin specific settings

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; clipboard
(defun copy-to-clipboard ()
  (interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc (buffer-substring (region-beginning) (region-end)))
      (process-send-eof proc))))
