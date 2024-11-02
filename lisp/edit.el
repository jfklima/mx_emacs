(use-package company
  :ensure t
  :diminish company-mode
  :config
  (setq completion-ignore-case t)
  (add-hook 'prog-mode-hook #'company-mode))


(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))


(use-package crux
  :ensure t
  :config
  (global-set-key [remap beginning-of-line] 'crux-move-beginning-of-line)
  (global-set-key [remap join-line] 'crux-top-join-line)
  (global-set-key [remap delete-file] 'crux-delete-file-and-buffer)
  (global-set-key [remap rename-file] 'crux-rename-buffer-and-file))


(use-package avy
  :commands avy-goto-char avy-goto-char-in-linee
  :ensure t
  :config
  (setq avy-background t)

  (motion-map
    "j" 'avy-goto-char
    "," 'avy-goto-char-in-line))


(use-package undo-fu :ensure t
  :config
  (global-set-key [remap undo] 'undo-fu-only-undo)
  (global-set-key [remap undo-redo] 'undo-fu-only-redo))


(use-package zzz-to-char :ensure t
  :config
  (global-set-key [remap zap-to-char] 'zzz-to-char)
  (global-set-key [remap zap-up-to-char] 'zzz-up-to-char))


(use-package move-text :ensure t
  :preface
  (defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
	(indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))

  :config
  (advice-add 'move-text-up :after 'indent-region-advice)
  (advice-add 'move-text-down :after 'indent-region-advice))

(edit-map
  "t" 'move-text-down
  "T" 'move-text-up)
(visual-map
  "t" 'move-text-down
  "T" 'move-text-up)


(use-package iedit :ensure t
  :config
  (add-hook 'iedit-mode-hook 'insert-state)
  (add-hook 'iedit-mode-end-hook 'edit-state))


(provide 'edit)
