(use-package bufler :ensure t
  ;; :commands bufler
  :diminish bufler-mode
  :config
  (global-set-key [remap ibuffer] 'bufler)
  (bufler-mode 1))

(use-package beacon :ensure t
  :config (beacon-mode 1))

(provide 'util)
