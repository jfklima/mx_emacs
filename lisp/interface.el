(use-package multistate
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

(use-package swiper
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "C-l") #'ivy-backward-delete-char))

(general-def
 :keymaps 'edit
 "m" 'newline
 "o" 'open-line

 "l" 'recenter-top-bottom

 "k" 'kill-line
 "y" 'yank

 "/" 'undo

 "d" 'delete-char
 "D" 'kill-word
 "x" 'backward-delete-char
 "X" 'backward-kill-word

 "]" 'scroll-other-window
 "[" 'scroll-other-window-down

 "g" 'keyboard-quit)

(general-def
 :keymaps 'motion
 "b" 'backward-char
 "f" 'forward-char

 "n" 'next-line
 "p" 'previous-line

 "a" 'move-beginning-of-line
 "e" 'move-end-of-line

 "j" 'avy-goto-char

 "v" 'scroll-up-command
 "V" 'scroll-down-command)

(general-def
 :keymaps 'mark
 "w" 'kill-region
 "W" 'kill-ring-save)

(space-leader
  "SPC" '(:def execute-extended-command :wk "M-x")

  "f" '(:def nil :wk "files")
  "f f" '(:def find-file :wk "find-file")

  "b" '(:def nil :wk "buffer")
  "b b" '(:def switch-to-buffer :wk "buffer-list")
  "b s" 'save-buffer
  "b k" 'kill-this-buffer

  "w" '(:def nil :wk "windows")
  "w u" '(:def delete-other-windows :window-unique)
  "w o" 'other-window

  "p" '(:def projectile-command-map :wk "projectil")

  "s" '(:def nil :wk "search")
  "s s" 'swiper

  "g" '(:def nil :wk "git")
  "g s" '(:def magit-status :wk "status")

  "m" '(:def nil :wk "mode"))

(mode-leader :keymaps 'org-mode-map
  "n" 'org-next-visible-heading
  "p" 'org-previous-visible-heading
  "f" 'org-forward-heading-same-level
  "b" 'org-backward-heading-same-level
  "u" 'outline-up-heading
  "j" 'org-goto
  "s" 'org-sparse-tree)

(provide 'interface)
