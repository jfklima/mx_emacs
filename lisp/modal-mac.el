(use-package caps-lock :ensure t)

(use-package multistate
  :diminish ""
  :ensure t
  :hook
  ;; enable selection is Visual state
  (multistate-visual-state-enter . (lambda () (set-mark (point))))
  (multistate-visual-state-exit .  deactivate-mark)

  ;; enable overwrite-mode in Replace state
  (multistate-replace-state-enter . overwrite-mode)
  (multistate-replace-state-exit .  (lambda () (overwrite-mode 0)))

  (multistate-capslock-state-enter . caps-lock-mode)
  (multistate-capslock-state-exit . (lambda () (caps-lock-mode 0)))

  :init
  (multistate-define-state 'emacs :lighter "Emacs")

  (multistate-define-state
   'insert
   :lighter "Insert"
   :cursor '(bar . 4)
   :parent 'multistate-emacs-state-map)

  (multistate-define-state
   'motion
   :lighter "Motion"
   :parent 'multistate-suppress-map)

  (multistate-define-state
   'edit
   ;; :default t
   :lighter "Edit"
   :cursor 'box
   :parent 'multistate-motion-state-map)

  (multistate-define-state
   'normal
   :default t
   :lighter "Normal"
   :parent 'multistate-edit-state-map)

  (multistate-define-state
   'replace
   :lighter "R"
   :cursor 'hbar)

  (multistate-define-state
   'visual
   :lighter "Visual"
   :cursor 'hollow
   :parent 'multistate-motion-state-map)

  (multistate-define-state
   'capslock
   :lighter "CAPS"
   :cursor '(hbar . 5))

  :config
  (add-hook 'text-mode-hook 'multistate-mode)
  (add-hook 'prog-mode-hook 'multistate-mode)
  (add-hook 'conf-mode-hook 'multistate-mode)

  (global-set-key (kbd "M-m") 'multistate-mode)

  (add-hook 'deactivate-mark-hook 'multistate-edit-state)

  (defun edit-state () (interactive) (multistate-edit-state))
  (defun insert-state () (interactive) (multistate-insert-state))
  (defun visual-state () (interactive) (multistate-visual-state))
  (defun replace-state () (interactive) (multistate-replace-state))

  :bind
  (:map multistate-emacs-state-map
	("M-m" . edit-state))

  (:map multistate-insert-state-map
	("<return>" . edit-state)
	("M-u" . multistate-capslock-state)
	("M-i" . company-complete)
	("TAB" . company-complete)
	("SPC" . self-insert-command))

  (:map multistate-capslock-state-map
	("M-u" . multistate-insert-state)
	("<return>" . multistate-edit-state)
	("SPC" . self-insert-command))

  (:map multistate-visual-state-map
	("<return>" . edit-state))

  (:map multistate-edit-state-map
	("i" . multistate-insert-state)
	("R" . multistate-replace-state)
	("M-u" . multistate-capslock-state)
	("<return>" . multistate-visual-state))

  (:map multistate-replace-state-map
	("<return>" . multistate-edit-state)))

(use-package general :ensure t
  :config
  (setf (alist-get 'insert general-keymap-aliases) 'multistate-insert-state-map)
  (setf (alist-get 'edit general-keymap-aliases) 'multistate-edit-state-map)
  (setf (alist-get 'visual general-keymap-aliases) 'multistate-visual-state-map)
  (setf (alist-get 'replace general-keymap-aliases) 'multistate-replace-state-map)
  (setf (alist-get 'motion general-keymap-aliases) 'multistate-motion-state-map)

  (general-create-definer edit-map :keymaps 'edit)
  (general-create-definer motion-map :keymaps 'motion)
  (general-create-definer visual-map :keymaps 'visual)

  (general-create-definer space-leader :keymaps 'motion :prefix "SPC")
  (general-create-definer mode-leader :keymaps 'space-leader :prefix "SPC m"))


(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5)
  (setq which-key-idle-secondary-delay 0.1)
  (which-key-mode +1))

(provide 'modal-mac)
