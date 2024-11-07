(use-package helm-dash :ensure t
  :config
  (mode-leader :keymaps 'prog-mode-map
    "d" 'helm-dash
    "." 'helm-dash-at-point))
()

(add-hook 'prog-mode-hook (lambda () (setq-local helm-dash-docsets '("PostgreSQL"))))

(add-hook 'python-mode-hook (lambda () (setq-local helm-dash-docsets '("Python 3"))))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local helm-dash-docsets '("Emacs Lisp"))))
(add-hook 'ruby-mode-hook (lambda () (setq-local helm-dash-docsets '("Ruby"))))


(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(provide 'programming)
