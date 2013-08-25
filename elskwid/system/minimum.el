;; minimum required system setup

;; seed random-number generator
(random t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; relocate autosave and backup files - similar to @bitbckt
(setq autosave-dir (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(setq backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))

(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

(setq auto-save-list-file-prefix autosave-dir)

(make-directory autosave-dir t)

(setq backup-directory-alist `((".*" . ,backup-dir)))
