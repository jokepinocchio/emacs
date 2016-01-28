(require 'recent-jump)
(setq recent-jump-threshold 20)
(setq recent-jump-ring-length 100)
(global-set-key (kbd "C-o") 'recent-jump-jump-backward)
(global-set-key (kbd "M-o") 'recent-jump-jump-forward)

;;(require 'quick-jump)
;;(quick-jump-default-keybinding)

(provide 'init-recent-jump)
