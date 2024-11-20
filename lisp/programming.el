;; otimizar emacs para rodar o lsp-mode
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package flycheck :ensure t
  :hook (lsp-mode . flycheck-mode))


(use-package tree-sitter :ensure t
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


(use-package lsp-mode :ensure
  ;; :hook (python-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-idle-delay 0.500
	lsp-completion-enable t))

(use-package lsp-ui :ensure t
  :commands lsp-ui-mode
  :config
  (setq
   ;; Sideline code actions * disable whole sideline via
   lsp-ui-sideline-enable nil
   ;; hide code actions
   lsp-ui-sideline-show-code-actions nil
   ;; Sideline hover symbols * disable whole sideline via
   lsp-ui-sideline-enable nil))

(use-package helm-lsp :ensure t :demand t)

(use-package helm-dash :ensure t
  :config
  (setq dash-docs-enable-debugging nil))
(mode-leader :keymaps 'prog-mode-map
  "d" '(:def helm-dash :wk "dash")
  "." '(:def helm-dash-at-point :wk "dash-at-point")
  "A" '(:def helm-dash-activate-docset :wk "activate-docset")
  "D" '(:def helm-dash-deactivate-docset :wk "deactivate-docset"))

(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(electric-pair-mode 1)

(use-package yasnippet :config (yas-global-mode))
(use-package hydra)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-ui-controls-mode 1))

(use-package lsp-treemacs)

(provide 'programming)
