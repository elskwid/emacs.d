;; https://github.com/JEG2/dotfiles/blob/master/emacs.d/jeg2/commands/html.el
;;;###autoload
(defun jeg2/html-insert-open-and-close-tag ()
  "Generates an open and close HTML snippet using the current word."
  (interactive)
  (let ((inserting-new-tag nil))
    (if (looking-back "[-A-Za-z0-9:_]")
        (progn (set-mark-command nil)
               (while (looking-back "[-A-Za-z0-9:_]")
                 (backward-char)))
      (setq inserting-new-tag t)
      (set-mark-command nil)
      (insert "p")
      (exchange-point-and-mark))
    (let ((tag (buffer-substring (region-beginning) (region-end))))
      (delete-char (string-width tag))
      (cond ((string-match "\\`[bh]r\\'" tag)
             (insert (concat "<" tag ">")))
            ((string-match (concat "\\`\\(?:img\\|meta\\|link\\|"
                                   "input\\|base\\|area\\|col\\|"
                                   "frame\\|param\\)\\'")
                           tag)
             (yas/expand-snippet (concat "<" tag " $1>$0")))
            (t
             (yas/expand-snippet
              (if inserting-new-tag
                  (concat "<${1:"
                          tag
                          "}>$0</${1:"
                          "$(and (string-match \"[-A-Za-z0-9:_]+\" text) "
                          "(match-string 0 text))}>")
                (concat "<"
                        tag
                        "$1>$0</"
                        tag
                        ">"))))))))
