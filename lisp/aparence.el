(add-to-list 'default-frame-alist
	     '(font . "DejaVu Sans Mono-15"))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package nerd-icons :ensure t)

(use-package zenburn-theme :ensure t
  :disabled
  :config (load-theme 'zenburn t))


(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  (setq doom-themes-neotree-file-icons t)

  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.

  (doom-themes-org-config))


(use-package minions :ensure t
  :config (minions-mode 1))


(use-package doom-modeline
  :ensure t
  :config
  (setq
   ;; Uma modeline bem visível
   doom-modeline-height 40
   ;; não mostra se o buffer não está salvo, por causa do super-save
   doom-modeline-buffer-state-icon nil
   doom-modeline-buffer-modification-icon nil)

  ;; hora na modeline
  (setq display-time-string-forms
        '((propertize (concat 24-hours ":" minutes)))
	doom-modeline-time-icon nil)

  (display-time-mode t)

  :init (doom-modeline-mode 1))


(provide 'aparence)
