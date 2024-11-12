;; otimizar emacs para rodar o lsp-mode
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package flycheck :ensure t
  :hook (lsp-mode . flycheck-mode))
  ;; :config
  ;; (add-hook 'python-init-hook #'flycheck-mode))


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

(use-package lsp-pyright :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))


(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)

(use-package helm-dash :ensure t
  :config
  (setq dash-docs-enable-debugging nil)
  (mode-leader :keymaps 'prog-mode-map
    "d" 'helm-dash
    "." 'helm-dash-at-point))

;; (add-hook 'rust-mode-hook #'lsp)

(add-hook 'prog-mode-hook (lambda () (setq-local helm-dash-docsets '("PostgreSQL"))))

(add-hook 'python-mode-hook (lambda () (setq-local helm-dash-docsets '("Python 3"))))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local helm-dash-docsets '("Emacs Lisp"))))
(add-hook 'ruby-mode-hook (lambda () (setq-local helm-dash-docsets '("Ruby"))))
(add-hook 'rust-mode-hook (lambda () (setq-local helm-dash-docsets '("Rust"))))


(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(use-package rust-mode :ensure t
  :hook (rust-mode . lsp)
  ;; :hook (rust-mode . (lambda () (setq indent-tabs-mode nil)))
  :config
  ;; (add-hook 'rust-mode-hook #'tree-sitter-mode)
  (setq
   ;; trabalha com espaçõs em vez de tabulações
   indent-tabs-mode nil))

(mode-leader :keymaps 'rust-mode-map
  "C" 'rust-compile
  "K" 'rust-check
  "T" 'rust-test
  "R" 'rust-run
  "L" 'rust-run-clippy
  "F" 'rust-format-buffer
  "D" 'rust-dbg-wrap-or-unwrap
  "M" 'rust-toggle-mutability
  "l" 'cargo-mode-execute-task)

(mode-leader :keymaps 'prog-mode-map
  :if lsp-mode
  "d" 'helm-lsp-diagnostics
  "a" 'helm-lsp-code-actions
  "s" 'helm-lsp-workspace-symbol
  "g" 'helm-lsp-global-workspace-symbol)

;; (use-package rustic :ensure t
;;   :disabled
;;   :hook (rust-mode . rustic-mode))

(use-package cargo-mode :ensure t
  ;; :disabled
  :hook
  (rust-mode . cargo-minor-mode)
  :init
  (add-to-list 'load-path "/home/franklin/.asdf/shims/cargo")
  :config
  (setq compilation-scroll-output t))

(provide 'programming)
