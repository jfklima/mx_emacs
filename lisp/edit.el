(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'prog-mode-hook #'company-mode))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package crux
  :ensure t
  :bind
  ("C-a" . crux-move-beginning-of-line))

(use-package avy
  :ensure t
  :config
  (setq avy-background t))


(provide 'edit)
