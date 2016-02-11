(require-package 'dired+)

(after-load 'dired
  (require 'dired+)
  (toggle-diredp-find-file-reuse-dir nil)
  (setq dired-recursive-deletes 'top))

(provide 'init-dired)
