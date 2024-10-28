(use-package eglot :ensure t)

(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 '(python-mode . ("ruff-lsp"))
		 '(python-mode . ("pyright-server"))))

(add-hook 'python-mode-hook #'eglot-ensure)

(unless (package-installed-p 'helm-dash)
  (package-install 'helm-dash))

(require 'helm-dash)

;; (add-hook 'python-mode-hook (setq-local dash-docs-docsets '("Python 3")))

(mode-leader :keymaps 'prog-mode-map
  "d" 'helm-dash)

(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(provide 'programming)
