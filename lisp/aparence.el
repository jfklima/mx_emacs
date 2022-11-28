(use-package all-the-icons
  :ensure t)


(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'aparence)
