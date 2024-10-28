(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-project-search-path '("~/Projetos"))
  (global-set-key [remap projectile-find-dir] 'neotree-projectile-action)
  (projectile-mode +1))

(use-package neotree
  :ensure t
  :preface
  (defun custom-neotree-enter-hide ()
    (interactive)
    (neotree-enter)
    (let ((current (neo-buffer--get-filename-current-line)))
      (if (not (and current (file-accessible-directory-p current)))
	  (neotree-hide))))

  :config
  ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-theme 'icons
	neo-smart-open t
	neo-window-width 40)
  (setq projectile-switch-project-action 'projectile-find-file)

  ;; abrir no arquivo atual
  ;; fechar quando abrir um arquivo com return

  (let ((map neotree-mode-map))
    (define-key map (kbd "RET") 'custom-neotree-enter-hide)
    (define-key map (kbd "C") 'neotree-create-node)
    (define-key map (kbd "D") 'neotree-delete-node)
    (define-key map (kbd "R") 'neotree-rename-node)
    (define-key map (kbd "P") 'neotree-copy-node))

  (space-leader
    "d" '(:def nil :wk "directory")
    "d d" 'neotree-toggle
    ))

(space-leader
  ;; magit
  "g" '(:def nil :wk "git")
  "g s" 'magit-status
  "g d" 'magit-file-dispatch
  "g D" 'magit-dispatch)

(provide 'projects)
