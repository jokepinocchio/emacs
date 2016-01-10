;;;; cscope - see `http://cscope.sourceforge.net/'
;;;
;;; Build and Install
;;; ================
;;; ./configure
;;; make
;;; sudo make install
;;;
;;; cp contrib/xcscope/xcscope.el ~/.emacs.d/site-lisp/xcscope/xcscope.el
;;; sudo cp contrib/xcscope/cscope-indexer /usr/local/bin
;;; sudo chmod 744 /usr/local/bin/cscope-indexer
;;;
;;; not require install xcscope in package, instead it use cscope src xcscope.el
;;(require-package 'xcscope)

;; only use xcscope in c/c++ mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             (require 'xcscope)))
;; (require 'xcscope)

(provide 'init-cscope)


