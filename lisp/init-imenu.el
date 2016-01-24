;;; imenu-list
;;; https://github.com/bmag/imenu-list
; n: next line
; p: previous line
; f: toggle case-folding(hs-toggle-hiding)

;; depend on code style, if display not correct, indent(C-M-\) first.
(require-package 'imenu-list)

(global-set-key (kbd "C-c `") 'imenu-list-minor-mode)

;; Some users might perfer the imenu-list-minor-mode command to also set the focus to the
;; *Ilist* window. To do so, use the variable imenu-list-focus-after-activation:
(setq imenu-list-focus-after-activation t)

;; The size of *Ilist* window can be automatically resized every time the *Ilist* buffer is
;; updated. To do so, use the variable imenu-list-auto-resize:
(setq imenu-list-auto-resize t)

;;imenu-list-size
(setq imenu-list-position 'left)



(provide 'init-imenu)

