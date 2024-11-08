;; otimizar emacs para rodar o lsp-mode
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-mode :ensure
  ;; :hook (python-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-idle-delay 0.500))

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

(use-package lsp-pyright :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred


(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)


(use-package flycheck
  :ensure t
  :config
  (add-hook 'python-init-hook #'flycheck-mode))


(use-package helm-dash :ensure t
  :config
  (mode-leader :keymaps 'prog-mode-map
    "d" 'helm-dash
    "." 'helm-dash-at-point))

(add-hook 'prog-mode-hook (lambda () (setq-local helm-dash-docsets '("PostgreSQL"))))

(add-hook 'python-mode-hook (lambda () (setq-local helm-dash-docsets '("Python 3"))))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local helm-dash-docsets '("Emacs Lisp"))))
(add-hook 'ruby-mode-hook (lambda () (setq-local helm-dash-docsets '("Ruby"))))


(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(provide 'programming)
