(use-package beacon :ensure t
  :config (beacon-mode 1))

(use-package recentf
  :config
  (setq recentf-max-saved-items 200
	recentf-max-menu-items 15)
  (recentf-mode +1))

(space-leader
  "f r" 'counsel-recentf)


(provide 'util)
