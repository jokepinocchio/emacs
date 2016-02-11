(require-package 'sr-speedbar)
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 30)
(setq sr-speedbar-right-side nil)

(global-set-key (kbd "<f5>") (lambda()
                               (interactive)
                               (sr-speedbar-toggle)))

(provide 'init-speedbar)
