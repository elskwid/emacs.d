;; load minimum required settings
(user/system "minimum.el")

;; load OS specific settings
(user/system (symbol-name system-type))

;; load system specific settings
(user/system (concat (car (split-string (system-name) "\\."))))
