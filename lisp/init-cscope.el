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
;;; sudo chmod 755 /usr/local/bin/cscope-indexer
;;;
;;; Keybindings copy from xcscope.elx
;;;===============
;;; All keybindings use the "C-c s" prefix, but are usable only while
;;; editing a source file, or in the cscope results buffer:
;;;
;;;      C-c s s         Find symbol.
;;;      C-c s d         Find global definition.
;;;      C-c s g         Find global definition (alternate binding).
;;;      C-c s G         Find global definition without prompting.
;;;      C-c s c         Find functions calling a function.
;;;      C-c s C         Find called functions (list functions called
;;;                      from a function).
;;;      C-c s t         Find text string.
;;;      C-c s e         Find egrep pattern.
;;;      C-c s f         Find a file.
;;;      C-c s i         Find files #including a file.
;;;
;;; These pertain to navigation through the search results:
;;;
;;;      C-c s b         Display *cscope* buffer.
;;;      C-c s B         Auto display *cscope* buffer toggle.
;;;      C-c s n         Next symbol.
;;;      C-c s N         Next file.
;;;      C-c s p         Previous symbol.
;;;      C-c s P         Previous file.
;;;      C-c s u         Pop mark.
;;;
;;;      C-c s I         make cscope.* files
;;;
;;;
;;; not require install xcscope in package, instead it use xcscope.el that in cscope src.
;;(require-package 'xcscope)

;; only use xcscope in c/c++ mode
;;(add-hook 'c-mode-common-hook
;;          '(lambda ()
;;             (require 'xcscope)))
;;(require-package 'xcscope)
;;(require-package 'helm-cscope)

(require 'xcscope)

(provide 'init-cscope)


