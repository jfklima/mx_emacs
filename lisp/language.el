(use-package cc-mode
  :config
  ; set k&r style
  (setq c-default-style "k&r")
  (setq c-basic-offset 4))

(require 'dap-python)
(setq dap-python-debugger 'debugpy)

(use-package poetry)

(use-package lsp-pyright :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))


(use-package rust-mode :ensure t
  :hook (rust-mode . lsp)
  :config
  (setq
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
(use-package cargo-mode :ensure t
  ;; :disabled
  :hook
  (rust-mode . cargo-minor-mode)
  :init
  (add-to-list 'load-path "/home/franklin/.asdf/shims/cargo")
  :config
  (setq compilation-scroll-output t))


(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-java :ensure nil)


(provide 'language)
