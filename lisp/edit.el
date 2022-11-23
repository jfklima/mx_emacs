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
<<<<<<< HEAD
  :ensure t
  :config
  (global-set-key [remap join-line] 'crux-top-join-line)
  (global-set-key [remap delete-file] 'crux-delete-file-and-buffer))
=======
  :ensure t)
>>>>>>> c809f007421de79e4e7a56441ec5d999100ad46d

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
<<<<<<< HEAD
  (ruby-mode . aggressive-indent-mode))

(let ((package 'zzz-to-char))
  (unless (package-installed-p package)
    (package-install package)))

(require 'zzz-to-char)
(global-set-key [remap zap-to-char] 'zzz-to-char)
(global-set-key [remap zap-up-to-char] 'zzz-up-to-char)
=======
  (python-mode . aggressive-indent-mode)
  )

>>>>>>> c809f007421de79e4e7a56441ec5d999100ad46d

(provide 'edit)
