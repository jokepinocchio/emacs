;;; setup xcscope.el from cscope src to site-lisp
;;(require-package 'xcscope)

;; only use xcscope in c/c++ mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             (require 'xcscope)))
;; (require 'xcscope)

(provide 'init-cscope)


