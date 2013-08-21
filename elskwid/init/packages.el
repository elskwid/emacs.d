(require 'package)

(dolist (repo '(("elpa"      . "http://tromey.com/elpa/")
                ("marmalade" . "http://marmalade-repo.org/packages/")
                ("melpa"     . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives repo))

(defun user/package-refresh-and-install (name)
  "Ensure we have a fresh package list, then install."
  (package-refresh-contents)
  (package-install name))

(defun user/package-install-unless-installed (name)
  "Install a package by name unless it is already installed."
  (or (package-installed-p name) (user/package-refresh-and-install name)))

(defun user/package-version-for (package)
  "Get the version of a loaded package."
  (package-desc-vers (cdr (assoc package package-alist))))

(defun user/package-delete-by-name (package)
  "Remove a package by name."
  (package-delete (symbol-name package)
                  (package-version-join (user/package-version-for package))))

(defun user/package-delete-unless-listed (packages)
  "Remove packages not explicitly declared."
  (dolist (package (mapcar 'car package-alist))
    (unless (memq package packages) (user/package-delete-by-name package))))

(defun user/package-install-and-remove-to-match-list (&rest packages)
  "Sync packages so the installed list matches the passed list."
  (package-initialize)
  (condition-case nil ;; added to handle no-network situations
      (mapc 'user/package-install-unless-installed packages)
    (error (message "Couldn't install package. No network connection?")))
  (user/package-delete-unless-listed packages))

;; not installed

;; from JEG2
;;  'color-theme-sanityinc-tomorrow
;;  'full-ack
;;  'web-mode
;;  'yagist
;;  'yaml-mode
;;  'yasnippet

;; from avdi
;;  'findr
;;  'inflections
;;  'magithub

(user/package-install-and-remove-to-match-list
  'expand-region
  'dash
  'fill-column-indicator
  'git-commit-mode
  'idomenu
  'ido-ubiquitous
  'imenu
  'inf-ruby
  'magit
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
  'markdown-mode
  'rainbow-mode
  'ruby-mode
  'scss-mode
  )
