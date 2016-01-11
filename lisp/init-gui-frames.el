;; display time
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-format "%02H:%02M:%02S %Y-%02m-%02d %3a")
(setq display-time-interval 1)

(defun my-mode-line ()
  (setq-default
   mode-line-format
   (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                        'help-echo (format "%s" (buffer-file-name))
                        ))

    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                        'face 'font-lock-preprocessor-face
                        'help-echo (concat "Buffer is in "
                                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                                       'face 'font-lock-warning-face
                                       'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                                       'face 'font-lock-type-face
                                       'help-echo "Buffer is read-only"))))
    "] "

    ;; ;; line and column
     "(" ;; '%02' to set to 2 chars at least; prevents flickering
     (propertize "%01l" 'face 'font-lock-type-face) ","
     (propertize "%02c" 'face 'font-lock-type-face)
     ") "

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top

    ;; (propertize "%I" 'face 'font-lock-constant-face) ;; size
    '(:eval (when (and (not (buffer-modified-p)) my-mode-line-buffer-line-count)
              (propertize (concat "/" my-mode-line-buffer-line-count "L")
                          'face 'font-lock-type-face
                          )))

    "] "

    ;; the current major mode for the buffer.
    "["
    ;; mode-line-modes ;; too much infomation

    '(:eval (propertize "%m" 'face 'font-lock-string-face
                        'help-echo buffer-file-coding-system))

    "] "

    '(:eval (when vc-mode
              (concat "["
                      (propertize (string-strip (format "%s" vc-mode)) 'face 'font-lock-variable-name-face)
                      "] "
                      )))

    ;; '(:eval (format "Proj[%s] " (projectile-project-name)))

    ;; add the time, with the date and the emacs uptime in the tooltip
    '(:eval (propertize (format-time-string "%H:%M") ;;delete :%S
                        'face 'font-lock-type-face
                        'help-echo
                        (concat (format-time-string "%Y/%02m/%02d %02H:%02M:%02S %Y-%02m-%02d %3a; ")
                                (emacs-uptime "Uptime:%hh"))))

    ;; show buffer file name
    '(:eval (when show-buffer-file-name
              (format " [%s]" (buffer-file-name))))

    " "

    ;; date
    '(:eval (propertize (format-time-string "%Y/%02m/%02d/%3a")
                        'face 'font-lock-comment-face))


    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    minor-mode-alist  ;; list of minor modes
    ;"%-" ;; fill with '-'

    "line %l " ;;for test
    "-- user: "
    (getenv "USER")
    ))
  )
(my-mode-line)

; display line number
; (require 'linum)
(require-package 'hlinum)
(require 'hlinum)
(hlinum-activate)
(global-linum-mode t)

;; Highlight line mode on/off
;; hl-line.el
(global-hl-line-mode t)
(set-face-background 'hl-line "#0000ff")
(set-face-foreground 'highlight nil)

;; visual line
(global-visual-line-mode t)
;;(diminish 'global-visual-line-mode)
(diminish 'visual-line-mode)

(setq frame-title-format
  (list "[" '(:eval (projectile-project-name)) "]"
        "any str you want(not terminal)"
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;;----------------------------------------------------------------------------
;; Suppress GUI features
;;----------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;;----------------------------------------------------------------------------
;; Show a marker in the left fringe for lines not in the buffer
;;----------------------------------------------------------------------------
(setq indicate-empty-lines t)

;; NO tool bar or scroll bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;;(setq scroll-step 0)
;;(setq scroll-margin 0
;;      scroll-conservatively 100000
;;      scroll-up-aggressively 0.01
;;      scroll-down-aggressively 0.01
;;      scroll-preserve-screen-position t)

;; (set-scroll-bar-mode `right)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (unless window-system
                (set-frame-parameter nil 'menu-bar-lines 0)))))

(provide 'init-gui-frames)
