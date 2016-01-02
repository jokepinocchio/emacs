(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
;; (require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)
;; (require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; (require-package 'wgrep)
;; (require-package 'project-local-variables)
;; (require-package 'diminish)
;; (require-package 'scratch)
;; (require-package 'mwe-log-commands)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-proxies)
(require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flycheck)

(require 'init-recentf)
(require 'init-ido)
(require 'init-yasnippet)
(require 'init-hippie-expand)
(require 'init-auto-complete)
;; (require 'init-windows)
;; (require 'init-sessions)
(require 'init-fonts)
;; (require 'init-mmm)
(require 'init-tabbar)
(require 'init-editing-utils)
(require 'init-evil)
;; (require 'init-matlab)

;; (require 'init-vc)
;; (require 'init-darcs)
(require 'init-git)

;; (require 'init-crontab)
;; (require 'init-textile)
(require 'init-markdown)
(require 'init-auctex)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
(require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;; (require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;   (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)

;;(require 'init-themes)
(require 'init-color-theme)
;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;; ;;----------------------------------------------------------------------------
;; ;; Variables configured via the interactive 'customize' interface
;; ;;----------------------------------------------------------------------------
;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (when (file-exists-p custom-file)
;;   (load custom-file))


;; ;;----------------------------------------------------------------------------
;; ;; Allow users to provide an optional "init-local" containing personal settings
;; ;;----------------------------------------------------------------------------
;; (when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
;;   (error "Please move init-local.el to ~/.emacs.d/lisp"))
;; (require 'init-local nil t)


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
;; (require 'init-locales)

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))


(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "db08eb1e43f351490cfffd720db90600dd92d5cdf311f74350532ba71ae65c48" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
