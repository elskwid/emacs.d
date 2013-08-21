(setq my-settings-dir (concat my-config-dir "settings" "/"))

(defun user/settings (file)
  "This loads a settings file"
  (user/load-file (expand-file-name file my-settings-dir)))

(defun user/load-settings ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files my-settings-dir
                                 nil
                                 "\\.el$"))
    (user/settings file)))

(user/load-settings)
