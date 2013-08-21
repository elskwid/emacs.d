(setq my-vendor-dir (concat my-emacs-dir "vendor" "/"))

;; load path
(add-to-list 'load-path my-vendor-dir)

(defun user/vendor (path &optional reqstring)
  "This adds a vendored directory to the load path"
  (add-to-list 'load-path (expand-file-name path my-vendor-dir))
  (if reqstring (require reqstring)))

(defun user/theme (path)
  (add-to-list 'custom-theme-load-path (expand-file-name path my-vendor-dir)))

;; Ethan is OCD about whitespace
;; https://github.com/glasserc/ethan-wspace
(user/vendor "ethan-wspace/lisp/" 'ethan-wspace)

;; Color theme
;; https://github.com/neil477/base16-emacs
;; using this fork https://github.com/milkypostman/base16-emacs (2013-08-19)
;; until the main repo gets the light versions.
(user/theme "base16-emacs")
