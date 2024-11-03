(use-package beacon :ensure t
  :config (beacon-mode 1))


(use-package super-save :ensure t
  :config
  (setq
   ;; salva automaticamente quando ocioso
   super-save-auto-save-when-idle t
   ;; define salvamento automático imediato
   super-save-idle-duration 0.1
   ;; desliga o auto save default
   auto-save-default nil
   ;; não emite mensagens no minibuffer quando salva automaticamente
   super-save-silent t
   ;; excluir expaços em branco, exceto na linha corrente
   super-save-delete-trailing-whitespace 'except-current-line)

  (super-save-mode +1))


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
