(setq my-system-dir     (expand-file-name "system" my-config-dir))
(setq my-system-name    (or (getenv "EMACS_SYSTEM_NAME") system-name))

(defun user/system (file)
  "This loads a system file"
  (user/load-file (expand-file-name file my-system-dir) t))

;; load minimum required settings
(user/system "minimum.el")

;; load OS specific settings
(user/system (symbol-name system-type))

;; load system specific settings
(user/system (concat (car (split-string (system-name) "\\."))))

