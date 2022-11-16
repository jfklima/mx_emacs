(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  ;; pasta(s) onde o projectile irá buscar port projetos
  ;; automáticamente na inicialização
  (setq projectile-project-search-path '("~/workspace/projetos/"))
  (projectile-mode +1))

(provide 'projects)
