(require-package 'switch-window)

;; (require 'switch-window-autoloads)
;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key "\C-xp" 'other-window-backward)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'delete-other-window)
(provide 'init-switch-window)
