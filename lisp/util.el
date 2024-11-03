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

  (defun centaur-tabs-buffer-groups ()
  "`centaur-tabs-buffer-groups' control buffers' group rules.

Group centaur-tabs with mode if buffer is derived from `eshell-mode'
`emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `centaur-tabs-get-group-name' with project name."
  (list
   (cond

    ((derived-mode-p 'text-mode)
     "Editing")

    ((when-let ((project-name (centaur-tabs-project-name)))
       (format "Project: %s" (projectile-project-name))))

    ((or (string-equal "*" (substring (buffer-name) 0 1))
         (memq major-mode '( magit-process-mode
                             magit-status-mode
                             magit-diff-mode
                             magit-log-mode
                             magit-file-mode
                             magit-blob-mode
                             magit-blame-mode)))
     "Common")

    ((derived-mode-p 'config-mode)
     "Config")
    ((derived-mode-p 'prog-mode)
     "Programming")
    ((derived-mode-p 'dired-mode)
     "Dired")
    ((memq major-mode '(helpful-mode
                        help-mode))
     "Help")
    ((memq major-mode '(org-agenda-clockreport-mode
                        org-src-mode
                        org-agenda-mode
                        org-beamer-mode
                        org-indent-mode
                        org-bullets-mode
                        org-cdlatex-mode
                        org-agenda-log-mode
                        diary-mode))
     "OrgMode")

    (t
     (centaur-tabs-get-group-name (current-buffer))))))


  (defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
          (not (file-name-extension name)))
     )))

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

  ;; (centaur-tabs-group-buffer-groups)
  ;; (centaur-tabs-group-by-projectile-project)

   (edit-map
     "M-p" 'centaur-tabs-backward
     "M-n" 'centaur-tabs-forward
     "M-l" 'centaur-tabs-counsel-switch-group
     "M-k" 'centaur-tabs-kill-other-buffers-in-current-group
     "M-j" 'centaur-tabs-ace-jump)

  (centaur-tabs-mode t))


(provide 'util)
