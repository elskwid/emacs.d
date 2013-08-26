(require 'package)

(dolist (repo '(("elpa"      . "http://tromey.com/elpa/")
                ("marmalade" . "http://marmalade-repo.org/packages/")
                ("melpa"     . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives repo))

;; not installed

;; from JEG2
;;  'color-theme-sanityinc-tomorrow
;;  'full-ack
;;  'yagist
;;  'yaml-mode
;;  'yasnippet

;; from avdi
;;  'findr
;;  'inflections
;;  'magithub

;; Zenspider's package enhancements
;; https://github.com/zenspider/package
(user/vendor "package" 'package+)

(defun user/prepare-packages ()
  (package-manifest
   'expand-region
   'dash
   'fill-column-indicator
   'idomenu
   'ido-ubiquitous
   'imenu
   'inf-ruby
   ;;'magit
   'paredit
   'ruby-compilation
   'saveplace
   'smartparens
   'smex
   'uniquify
   'whitespace
   'window-number
   ;; modes
   'coffee-mode
   'css-mode
   'markdown-mode
   'rainbow-mode
   'ruby-mode
   'sass-mode
   'scss-mode
   'web-mode
   )

  ;; Ethan is OCD about whitespace
  ;; https://github.com/glasserc/ethan-wspace
  (user/vendor "ethan-wspace/lisp/" 'ethan-wspace)

  ;; Color theme
  ;; https://github.com/neil477/base16-emacs
  ;; using this fork https://github.com/milkypostman/base16-emacs (2013-08-19)
  ;; until the main repo gets the light versions.
  (user/theme "base16-emacs"))

(provide 'packages)
