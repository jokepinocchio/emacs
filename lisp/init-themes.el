(require-package 'color-theme)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; custom theme packages
;; can be removed
(add-to-list 'load-path
             (expand-file-name "themes" user-emacs-directory))
(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))
;;(require 'color-theme-blackboard)
(require 'molokai)
;;(require-package 'atom-dark-theme)

;; if you don't customize it, this is the theme you get
(setq-default custom-enabled-themes '(molokai))




;; Toggle between light and dark
(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-solarized-light))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark))


(provide 'init-themes)
