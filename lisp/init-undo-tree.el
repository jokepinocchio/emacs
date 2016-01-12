(require-package 'undo-tree)
;; (require 'undo-tree-autoloads)
(global-set-key (kbd "C-x u") 'undo-tree-visualize)
(global-undo-tree-mode t)
(global-set-key (kbd "C-z") 'undo)

(provide 'init-undo-tree)
