(use-package multistate
  :diminish ""
  :ensure t
  :hook
  ;; enable selection is Visual state
  (multistate-mark-state-enter . (lambda () (set-mark (point))))
  (multistate-mark-state-exit .  deactivate-mark)

  ;; enable overwrite-mode in Replace state
  (multistate-replace-state-enter . overwrite-mode)
  (multistate-replace-state-exit .  (lambda () (overwrite-mode 0)))

  :init
  (multistate-define-state 'emacs :lighter "Emacs")

  (multistate-define-state
   'insert
   :lighter "Insert"
   :cursor 'bar
   :parent 'multistate-emacs-state-map)

  (multistate-define-state
   'motion
   :lighter "Motion"
   :parent 'multistate-suppress-map)

  (multistate-define-state
   'edit
   :default t
   :lighter "Edit"
   :cursor 'box
   :parent 'multistate-motion-state-map)

  (multistate-define-state
   'replace
   :lighter "R"
   :cursor 'hbar)

  (multistate-define-state
   'mark
   :lighter "Mark"
   :cursor 'hollow
   :parent 'multistate-motion-state-map)

  :config
  ;; (multistate-global-mode 1)

  (add-hook 'text-mode-hook 'multistate-mode)
  (add-hook 'prog-mode-hook 'multistate-mode)

  (add-hook 'deactivate-mark-hook 'multistate-edit-state)

  (defun edit-state () (interactive) (multistate-edit-state))
  (defun insert-state () (interactive) (multistate-insert-state))
  (defun mark-state () (interactive) (multistate-mark-state))
  (defun replace-state () (interactive) (multistate-replace-state))

  :bind
  (:map multistate-emacs-state-map
	("M-m" . edit-state))

  (:map multistate-insert-state-map
	("<return>" . edit-state))

  (:map multistate-mark-state-map
	("<return>" . edit-state))

  (:map multistate-edit-state-map
	("i" . multistate-insert-state)
	("R" . multistate-replace-state)
	("<return>" . multistate-mark-state))

  (:map multistate-replace-state-map
	("<return>" . multistate-edit-state)))

(use-package general :ensure t
  :config
  (setf (alist-get 'insert general-keymap-aliases) 'multistate-insert-state-map)
  (setf (alist-get 'edit general-keymap-aliases) 'multistate-edit-state-map)
  (setf (alist-get 'mark general-keymap-aliases) 'multistate-mark-state-map)
  (setf (alist-get 'replace general-keymap-aliases) 'multistate-replace-state-map)
  (setf (alist-get 'motion general-keymap-aliases) 'multistate-motion-state-map)

  (general-create-definer space-leader :keymaps 'edit :prefix "SPC")
  (general-create-definer mode-leader :keymaps 'edit :prefix "SPC m"))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5)
  (setq which-key-idle-secondary-delay 0.1)
  (which-key-mode +1))

(provide 'modal-mac)
