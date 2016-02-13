(require-package 'color-theme)
(require-package 'airline-themes)
(require 'color-theme-molokai)


;; {{ work around color theme bug
;; @see https://plus.google.com/106672400078851000780/posts/KhTgscKE8PM
(defadvice load-theme (before disable-themes-first activate)
  ;; diable all themes
  (dolist (i custom-enabled-themes)
    (disable-theme i)))
;; }}

(color-theme-molokai)
;; This line must be after color-theme-molokai! Don't know why.
(setq color-theme-illegal-faces "^\\(w3-\\|dropdown-\\|info-\\|linum\\|yas-\\|font-lock\\)")
;; (color-theme-select 'color-theme-xp)
;; (color-theme-xp)


;;(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-molokai t)
;;(require 'main-line)
;;(setq main-line-separator-style 'contour)
(setq airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)


(provide 'init-color-theme)
