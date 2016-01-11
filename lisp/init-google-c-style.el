(require-package 'google-c-style)
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; google c sytle default offset is 2
(defun my-c-mode-hook ()
  (setq c-basic-offset 4))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(provide 'init-google-c-style)
