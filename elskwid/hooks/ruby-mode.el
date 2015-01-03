;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)

;;(add-hook 'ruby-mode-hook 'inf-ruby-keys)
;;(inf-ruby-keys)

;;(define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
(local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
;;(define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
(local-set-key (kbd "C-M-h") 'backward-kill-word)
;;(define-key 'help-command (kbd "S-r") 'ri)
(local-set-key (kbd "S-r") 'ri)

;; We never want to edit Rubinius bytecode or MacRuby binaries
(add-to-list 'completion-ignored-extensions ".rbc")
(add-to-list 'completion-ignored-extensions ".rbo")

;; activate character pairing
(smartparens-mode)

(sp-with-modes (list major-mode)
  (sp-local-pair "|" "|"))

;; no deep indentation
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-arglist nil)

;; no addition of -*- coding: utf-8 -*- comment
(setq ruby-insert-encoding-magic-comment nil)
