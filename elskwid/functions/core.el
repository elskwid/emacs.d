;; settings
(setq my-settings-dir (concat my-config-dir "settings" "/"))

;;;###autoload
(defun user/settings (file)
  "This loads a settings file"
  (user/load-file (expand-file-name file my-settings-dir)))

;;;###autoload
(defun user/load-settings ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files my-settings-dir
                                 nil
                                 "\\.el$"))
    (user/settings file)))

;; system
(setq my-system-dir     (expand-file-name "system" my-config-dir))
(setq my-system-name    (or (getenv "EMACS_SYSTEM_NAME") system-name))

;;;###autoload
(defun user/system (file)
  "This loads a system file"
  (user/load-file (expand-file-name file my-system-dir) t))

;; vendor
(setq my-vendor-dir (concat my-emacs-dir "vendor" "/"))

;; load path
(add-to-list 'load-path my-vendor-dir)

;;;###autoload
(defun user/vendor (path &optional reqstring)
  "This adds a vendored directory to the load path"
  (add-to-list 'load-path (expand-file-name path my-vendor-dir))
  (if reqstring (require reqstring)))

;;;###autoload
(defun user/theme (path)
  (add-to-list 'custom-theme-load-path (expand-file-name path my-vendor-dir)))
