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

;; Unset the default behavior of the C-x <left> and <right> arrow key navigation
(global-unset-key (kbd "M-p"))
(global-unset-key (kbd "M-n"))
(global-unset-key (kbd "M-l"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-j"))

(use-package centaur-tabs :ensure t
  :hook (emacs-startup . centaur-tabs-mode)

  :config
  (centaur-tabs-mode 1)

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
   ;; mostra ícones personalizados na guia
   centaur-tabs-set-icons t
   ;; torna os ícones com a mesma cor do text
   centaur-tabs-plain-icons nil
   ;; torna os ícones acinzentados para guias não selecionadas
   centaur-tabs-gray-out-icons 'buffer
   ;; força para o tipo all-the-icons, resolvendo um problema
   centaur-tabs-icon-type 'all-the-icons
   ;; para desativar o botão de fechar
   centaur-tabs-set-close-button nil
   ;; Navega apenas na guia do grupo atual
   centaur-tabs-cycle-scope 'tabs
   ;; Reordena as guias
   centaur-tabs-adjust-buffer-order 'right
   ;; mostra letras, ao invés de números
   centaur-tabs-ace-jump-keys '(?a ?s ?d ?f ?j ?k ?l ?ç))

  (defun centaur-tabs-buffer-groups ()
  "`centaur-tabs-buffer-groups' control buffers' group rules.

Group centaur-tabs with mode if buffer is derived from `eshell-mode'
`emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `centaur-tabs-get-group-name' with project name."
  (list
   (cond
    ((when-let ((project-name (centaur-tabs-project-name)))
       (format "Project: %s" (projectile-project-name))))

    ((memq major-mode '( magit-process-mode
                         magit-status-mode
                         magit-diff-mode
                         magit-log-mode
                         magit-file-mode
                         magit-blob-mode
                         magit-blame-mode))
     "Magit")
    ((derived-mode-p 'shell-mode) "Shell")
    ((derived-mode-p 'eshell-mode) "EShell")
    ((derived-mode-p 'emacs-lisp-mode) "Elisp")
    ((derived-mode-p 'dired-mode) "Dired")
    ((memq major-mode '(org-mode org-agenda-mode diary-mode)) "OrgMode")

    ((string-equal "*" (substring (buffer-name) 0 1))
     "System")

    (t
     (centaur-tabs-get-group-name (current-buffer))))))

  :bind (("M-p" . centaur-tabs-backward)
	 ("M-n" . centaur-tabs-forward)
	 ("M-l" . centaur-tabs-counsel-switch-group)
	 ("M-k" . centaur-tabs-kill-other-buffers-in-current-group)
	 ("M-j" . centaur-tabs-ace-jump)))


(provide 'util)
