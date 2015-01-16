(require 'evil)

(evil-define-motion evil-move-forward-paren (count)
  "Move forward to next (, [, {, }, ] or )"
  :jump t
  :type inclusive
  (interactive "<c>")
  (setq count (or count 1))
  (forward-char)
  (re-search-forward "\\s(\\|\\s)" nil 'end-of-buffer count)
  (while (and (in-string-p) (< (point) (point-max)))
    (re-search-forward "\\s(\\|\\s)" nil 'end-of-buffer))
  (backward-char))

(evil-define-motion evil-move-backward-paren (count)
  "Move backward to previous (, [, {, }, ] or )"
  :jump t
  :type inclusive
  (interactive "<c>")
  (setq count (or count 1))
  (re-search-backward "\\s(\\|\\s)" nil 'beginning-of-buffer count)
  (while (and (in-string-p) (> (point) (point-min)))
    (re-search-backward "\\s(\\|\\s)")))

(provide 'evil-walk-on-the-edge)
