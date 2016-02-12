(require-package 'tabbar)
(require 'tabbar)
(tabbar-mode 1)

;;(global-set-key (kbd "C-c p") 'tabbar-backward)
;;(global-set-key (kbd "C-c n") 'tabbar-forward)

(global-set-key (kbd "M-J") 'tabbar-forward)
(global-set-key (kbd "M-K") 'tabbar-backward)

(provide 'init-tabbar)
