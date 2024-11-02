(use-package beacon :ensure t
  :config (beacon-mode 1))

(use-package recentf
  :config
  (setq recentf-max-saved-items 200
	recentf-max-menu-items 15)
  (recentf-mode +1))

(space-leader
  "f r" 'counsel-recentf)


(use-package helpful :ensure t
  :config
  (global-set-key [remap describe-function] 'helpful-callable)
  (global-set-key [remap describe-symbol] 'helpful-symbol)
  (global-set-key [remap describe-key] 'helpful-key)
  (space-leader
    "h c" 'helpful-command
    "h ." 'helpful-at-point))


(provide 'util)
