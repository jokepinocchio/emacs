;; (add-to-list 'load-path (expand-file-name "lisp/editing-utils" user-emacs-directory))
;; enhanced help mechanism
(require-package 'help-fns+)
(require 'help-fns+)

;; dimish minor mode name to save mode line space
(require-package 'diminish)

;; some default value
(setq-default
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 buffers-menu-max-size 20
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)


;;; Indent with spaces, not tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;; Autofill at 79 characters
(setq-default fill-column 79)

(defun go-to-char (n char)
    "Move forward to Nth occurence of CHAR.
    Typing `go-to-char-key' again will move forwad to the next Nth
    occurence of CHAR."
    (interactive "p\ncGo to char: ")
    (search-forward (string char) nil nil n)
    (while (char-equal (read-char)
                       char)
      (search-forward (string char) nil nil n))
    (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-x a") 'go-to-char)


;;; Show only 1 window on startup (useful if you open multiple files)
(add-hook 'emacs-startup-hook (lambda () (delete-other-windows)) t)

;;; Remove welcome message
;; Do not work?
(setq inhibit-startup-message t)

;; auto-revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t)

;; enable auto-pairing
(require 'init-autopair)
(diminish 'autopair-mode)

;; some personal key bindings
(global-set-key (kbd "C-c r") 'replace-string)

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; share clipboard
(setq x-select-enable-clipboard t)
;; expand-region
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; enable uppercase and lowercase transform for region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; whole-line-or-region-mode
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; enable cua mode without prefix key
(cua-selection-mode t)

;; use page-break-line to handle the ^L page-breaking symbol
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)

;; enable subword-mode
;; (global-subword-mode t)

;; multiple-cursors-mode
;; (require-package 'multiple-cursors)
;; multiple-cursors
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-+") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:
;; (global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
;; (global-set-key (kbd "C-c c c") 'mc/edit-lines)
;; (global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
;; (global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

;;; C-x C-b = ibuffer (better than list-buffers)
;;(define-key global-map [(control x)(control b)] (function ibuffer))

;; undo-tree
(require 'init-undo-tree)
(diminish 'undo-tree-mode)

;; TODO
(require-package 'highlight-symbol)
(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))
(add-hook 'org-mode-hook 'highlight-symbol-nav-mode)
(after-load 'highlight-symbol
  (diminish 'highlight-symbol-mode)
  (defadvice highlight-symbol-temp-highlight (around sanityinc/maybe-suppress activate)
    "Suppress symbol highlighting while isearching."
    (unless (or isearch-mode
                (and (boundp 'multiple-cursors-mode) multiple-cursors-mode))
      ad-do-it)))

;; outline-minor-mode
(require 'init-outl-minor)

;; use C-u C-u C-s/r to trigger the flexible search action
(require 'init-flex-isearch)


(provide 'init-editing-utils)
