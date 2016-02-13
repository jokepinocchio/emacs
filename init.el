
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startsup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *windows*  (eq system-type 'windows-nt))
(defconst *cygwin* (eq system-type 'cygwin))
(defconst *linux*  (or (eq system-type 'gnu/linux) (eq system-type 'linux)))
(defconst *unix*   (or *linux* (eq system-type 'usg-unix-v)
                       (eq system-type 'berkeley-unix)))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (require 'init-compat);;
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)
;;(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-editing-utils)
(require 'init-gui-frames)
(require 'init-highlight)
(require 'init-dired)
(require 'init-recentf)
(require 'init-ido)
(require 'init-yasnippet)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-fonts)
(require 'init-tabbar)
;;(require 'init-evil)
;;(require 'init-git)
(require 'init-compile)
;;(require 'init-markdown)
(require 'init-auctex)
(require 'init-org)
(require 'init-color-theme)
(require 'init-switch-window)
(require 'init-window-numbering)
(require 'init-google-c-style)

;;(require 'init-windows)
;;(require 'init-linum)

(when *spell-check-support-enabled*
  (require 'init-spelling))
;;(require 'init-ibuffer)
;;(require 'init-misc) ;; TODO
(require 'init-imenu)
(require 'init-recent-jump)
(require 'init-cscope)
(require 'init-gtags)
(require 'init-rtags)
(require 'init-neotree) ;like vim NERDTree
;;(require 'init-gdb)
(require 'init-helm)
(require 'init-projectile)
;;(require 'init-smex)
;;(require 'init-semantic)
;;(require 'init-speedbar)
;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))



(provide 'init)
;; End

