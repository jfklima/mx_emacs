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

(use-package avy
  :ensure t
  :config
  (setq avy-background t))

(use-package caps-lock
  :ensure t
  :bind ("C-c u" . 'caps-lock-mode))

(use-package undo-fu :ensure t
  :config
  (global-set-key [remap undo] 'undo-fu-only-undo)
  (global-set-key [remap undo-redo] 'undo-fu-only-redo))

(use-package aggressive-indent
  :ensure t
  :hook
  (emacs-lisp-mode . aggressive-indent-mode)
  (ruby-mode . aggressive-indent-mode))

(provide 'edit)
