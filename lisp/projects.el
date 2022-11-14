(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1))

(provide 'projects)
