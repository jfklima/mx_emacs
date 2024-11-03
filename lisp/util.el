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


(use-package centaur-tabs :ensure t
  :demand
  :config
  ;; Faz com que o rosto de manchete corresponder ao rosto de
   ;; centauro-tabs-default. Isso faz com que a barra de tabulação
   ;; tenha uma aparência uniforme.
  (centaur-tabs-headline-match)

  (setq
   ;; Muda a forma da aba
   centaur-tabs-style "wave"
   ;; Para alterar a altura da guia
   centaur-tabs-height 32
   ;; Exibe uma barra colorida na guia selecionada
   centaur-tabs-set-bar 'left
   ;; para desativar o botão de fechar
   centaur-tabs-set-close-button nil
   ;; Navega apenas na guia do grupo atual
   centaur-tabs-cycle-scope 'tabs
   ;; Reordena as guias
   centaur-tabs-adjust-buffer-order 'right
   ;; mostra letras, ao invés de números
   centaur-tabs-ace-jump-keys '(?a ?s ?d ?f ?j ?k ?l ?ç))

  (centaur-tabs-group-buffer-groups)
  (centaur-tabs-group-by-projectile-project)

   (edit-map
     "M-p" 'centaur-tabs-backward
     "M-n" 'centaur-tabs-forward
     "M-l" 'centaur-tabs-counsel-switch-group
     "M-k" 'centaur-tabs-kill-other-buffers-in-current-group
     "M-j" 'centaur-tabs-ace-jump)

  (centaur-tabs-mode t))


(provide 'util)
