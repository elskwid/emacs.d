;; elskwid emacs config
;; Conventions from zenspider, JEG2, avdi, and others.

(setq my-user       "elskwid")
(setq my-init-file  (or load-file-name buffer-file-name))
(setq my-emacs-dir  (file-name-directory my-init-file))
(setq my-config-dir (expand-file-name (concat my-user "/") my-emacs-dir))
(setq my-init-dir   (expand-file-name "init/" my-config-dir))

;; set emacs directory
(setq user-emacs-directory my-emacs-dir)

(defun user/load-file (path &optional noerror)
  "This loads a file from inside the the .emacs.d directory"
  (let ((file (file-name-sans-extension
               (expand-file-name path my-emacs-dir))))
    (load file noerror)))

(defun user/init (file)
  "This loads an init file"
  (user/load-file (expand-file-name file my-init-dir)))

;; load configuration settings by type
(user/init "freshen.el")
(user/init "system.el")
(user/init "autoload.el")
(user/init "packages.el")
(user/init "vendor.el")
(user/init "compile.el")
(user/init "autohooks.el")
(user/init "settings.el")

;; Customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("956c7a6f96330febac4c5c565f11de653d7c8eadd51d8dd4ecb3c54bf9cf47dc" "09e3db66aee06816c03fade43ee99b43304f81acb5438f50d286b4791413fa80" "a81a4eb22c7d8c2018a14d30c27d438aa433772802afbac32f30e5b230080cd2" "e87cd0c4d74b4553a7451e34b3f9b6c2ebd4d669ea4966ad45a20daea7d0897f" "71f116ced24c4993212d555b477d28500cca2d883781efa8effad812bde6369d" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
