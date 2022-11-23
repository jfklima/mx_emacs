(setq user-full-name "Jfranklin Lima"
      user-mail-address "jfranklincontatos@gmail.com")

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)
(setq ring-bell-function 'ignore)


(setq inhibit-startup-screen t)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq initial-scratch-message "")

(setq-default major-mode 'text-mode)
(add-hook 'text-mode 'auto-fill-mode)

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(desktop-save-mode 1)

(provide 'basic)
