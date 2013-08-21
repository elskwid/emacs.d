(setq my-hooks-dir (concat my-config-dir "hooks" "/"))

(defun user/autohooks ()
  "Autoload everthing in the hooks directory as a hook for the named mode."
  (interactive)
  (dolist (path (directory-files my-hooks-dir
                                 t
                                 "\\.el$"))
    (let* ((mode       (file-name-nondirectory
                        (file-name-sans-extension path)))
           (hook-name  (intern (concat mode "-hook")))
           (defun-name (intern (concat "user/" mode "-hook")))
           (lisp       (user/read-file-to-string path)))
      (eval (read (concat "(defun " (symbol-name defun-name) " () " lisp ")")))
      (and (functionp defun-name)
           (remove-hook hook-name defun-name))
      (add-hook hook-name defun-name))))

(user/autohooks)
