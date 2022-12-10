(use-package all-the-icons
  :ensure t)


(use-package zenburn-theme
  :disabled t
  :ensure t
  :config
  (load-theme 'zenburn t))


(use-package doom-themes
  :ensure t
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (load-theme 'doom-dracula t))


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


(provide 'aparence)
