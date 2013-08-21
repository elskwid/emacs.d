(require 'find-lisp)

(setq my-autoload-file (concat my-emacs-dir "loaddefs.el"))
(setq my-functions-dir (concat my-config-dir "functions" "/"))
(setq my-commands-dir  (concat my-config-dir "commands" "/"))

(defun user/autoload-directories (directories)
  "Regenerate the autoload definitions file if necessary and load it."
  (let ((autoload-file my-autoload-file))
    (if (or (not (file-exists-p autoload-file))
            (catch 'newer
              (dolist (directory directories)
                (dolist (file (find-lisp-find-files directory "\\.el$"))
                  (if (file-newer-than-file-p file autoload-file)
                      (throw 'newer file))))))
        (let ((generated-autoload-file autoload-file)
              (subdirectories (apply
                               'nconc
                               (mapcar
                                (lambda (directory)
                                  (find-lisp-find-files-internal
                                   directory
                                   'find-lisp-file-predicate-is-directory
                                   'find-lisp-default-directory-predicate))
                                directories))))
          (apply 'update-directory-autoloads (append directories
                                                     subdirectories))))))

(defun user/prepare-autoloads ()
  "Sets up and triggers autoload file."
  (user/autoload-directories (list my-functions-dir my-commands-dir))
  (add-to-list 'load-path my-emacs-dir t)
  (load my-autoload-file))

(user/prepare-autoloads)
