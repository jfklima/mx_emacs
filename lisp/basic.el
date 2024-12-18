(setq user-full-name "Jfranklin Lima"
      user-mail-address "jfranklincontatos@gmail.com")

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)

(setq inhibit-startup-screen t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

;; clear message initial of scratch
(setq initial-scratch-message "")

;; change major-mode fundamental for text-mode
(setq-default major-mode 'text-mode)

;; active auto-fill in text-mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; guardando a última posição dos buffers visitados
(use-package saveplace
  :init (save-place-mode))

;; revert o buffer automaticamente quando o arquivo muda no disco.
(global-auto-revert-mode t)

(provide 'basic)
