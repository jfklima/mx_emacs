(unless (package-installed-p 'helm-dash)
  (package-install 'helm-dash))

(require 'helm-dash)

(defun python-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Python 3")))


(defun ruby-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Ruby")))

(mode-leader :keymaps 'ruby-mode-map
  "d" 'helm-dash)

(mode-leader :keymaps 'python-mode-map
  "i" 'imenu
  "d" 'helm-dash)

(add-hook 'python-mode-hook 'python-doc)
(add-hook 'ruby-mode-hook 'ruby-doc)


;; (use-package flycheck
;; :disabled t
;; :ensure t
;; :init (global-flycheck-mode))


(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0) ;; default is 0.2
  :hook
  (python-mode . lsp)
  ;; if you want which-key integration
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-lens-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-eldoc-enable-hover nil)
  )


(use-package company-box
  :ensure t
  :hook
  (lsp . company-box-mode))
  ;; (python-mode . company-box-mode)
  ;; (gdscript-mode . company-box-mode))

(use-package gdscript-mode
  :ensure t
  :hook
  (gdscrip-mode . lsp))

(provide 'programming)
