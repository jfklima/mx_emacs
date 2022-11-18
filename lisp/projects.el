(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-project-search-path '("~/workspace/projetos/"))
  (projectile-mode +1))

(use-package neotree :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action)

  (let ((map neotree-mode-map))
    (define-key map (kbd "RET") (kbd "SPC"))
    (define-key map (kbd "C") 'neotree-create-node)
    (define-key map (kbd "D") 'neotree-delete-node)
    (define-key map (kbd "R") 'neotree-rename-node)
    (define-key map (kbd "P") 'neotree-copy-node))

  (space-leader
    "d d" 'neotree-toggle
    "p d" 'neotree-projectile-action
    ))

(provide 'projects)
