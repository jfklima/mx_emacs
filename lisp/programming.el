(use-package eglot :ensure t)

(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 '(python-mode . ("ruff-lsp"))
		 '(python-mode . ("pyright-server"))))

(add-hook 'python-mode-hook #'eglot-ensure)

(use-package counsel-dash :ensure t
  :config
  (global-set-key (kbd "C-c i") 'counsel-dash-install-docset)

  (mode-leader :keymaps 'prog-mode-map
  "d" 'counsel-dash))


(add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3"))))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
(add-hook 'ruby-mode-hook (lambda () (setq-local counsel-dash-docsets '("Ruby"))))

(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(provide 'programming)
