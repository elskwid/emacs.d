(defun user/byte-recompile-init ()
  "Recompile the files I use to setup Emacs."
  (byte-recompile-directory my-config-dir 0)
  ;; don't compile init.el because it's too late to freshen it on load
  ;; loaddefs.el cannot be compiled
  )

(user/byte-recompile-init)
