;;
;;  M-, ggtags-navigation-mode-abort
;;  M-. gtags-find-tag-dwim
;;  M-] ggtags-find-reference
;;  M-[ gtags-ext-create-or-update
;;  M-p ggtags-prev-mark
;;  M-n ggtags-next-mark

(require-package 'ggtags)
(require-package 'helm-gtags)
;;(setq gtags-suggested-key-mapping t)



(defun gtags-ext-produce-tags-if-needed (dir)
   (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
      (let ((default-directory dir))
        (shell-command "gtags && echo 'created tagfile'"))
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'"))
  )

;; @see http://emacs-fu.blogspot.com.au/2008/01/navigating-through-source-code-using.html
(defun gtags-ext-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (gtags-ext-produce-tags-if-needed (read-directory-name
                            "gtags: top of source tree:" default-directory)))

(defun gtags-ext-add-gtagslibpath (libdir &optional del)
  "add external library directory to environment variable GTAGSLIBPATH.\ngtags will can that directory if needed.\nC-u M-x add-gtagslibpath will remove the directory from GTAGSLIBPATH."
  (interactive "DDirectory containing GTAGS:\nP")
  (let (sl)
  (if (not (file-exists-p (concat (file-name-as-directory libdir) "GTAGS")))
      ;; create tags
      (let ((default-directory libdir))
        (shell-command "gtags && echo 'created tagfile'")))

  (setq libdir (directory-file-name libdir)) ;remove final slash
  (setq sl (split-string (if (getenv "GTAGSLIBPATH") (getenv "GTAGSLIBPATH") "")  ":" t))
  (if del (setq sl (delete libdir sl)) (add-to-list 'sl libdir t))
  (setenv "GTAGSLIBPATH" (mapconcat 'identity sl ":"))
  ))

(defun gtags-ext-print-gtagslibpath ()
  "print the GTAGSLIBPATH (for debug purpose)"
  (interactive)
  (message "GTAGSLIBPATH=%s" (getenv "GTAGSLIBPATH")))

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(global-set-key (kbd "M-,") 'ggtags-navigation-mode-abort)
(global-set-key (kbd "M-[") 'gtags-ext-create-or-update)

(provide 'init-gtags)
