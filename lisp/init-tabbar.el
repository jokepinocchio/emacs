(require-package 'tabbar)
(require 'tabbar)
(tabbar-mode 1)

;;(global-set-key (kbd "C-c p") 'tabbar-backward)
;;(global-set-key (kbd "C-c n") 'tabbar-forward)

(global-set-key (kbd "M-j") 'tabbar-forward)
(global-set-key (kbd "M-k") 'tabbar-backward)

(provide 'init-tabbar)
