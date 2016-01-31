;;https://github.com/jaypei/emacs-neotree
;; n: next line
;; p: previous line
;; g: Refresh
;; A: Maximize/Minimize the NeoTree Window
;; H: Toggle display hidden files
;; C-c C-n: Create a file or create a dirctory if filename ends with a '/
;; C-c C-d: Delete a file or a directory
;; C-c C-r: Rename a file of a directory
;; C-c C-c: Change the root directory
(require-package 'neotree)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(provide 'init-neotree)
