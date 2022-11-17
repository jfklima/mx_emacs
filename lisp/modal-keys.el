(general-def
 :keymaps 'edit
 "m" 'newline
 "o" 'open-line
 "C-j" 'join-line

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

  "TAB" '(:def (lambda ()
		 (interactive)
		 (switch-to-buffer (other-buffer)))
	       :wk "last-buffer")

  "h" '(:def nil :wk "help")
  "h" help-map

  "f" '(:def nil :wk "files")
  "f f" '(:def find-file :wk "find-file")
  "f i" '(:def (lambda ()
		 (interactive)
		 (find-file (concat user-emacs-directory "init.el")))
	       :wk "open-init")

  "b" '(:def nil :wk "buffer")
  "b b" '(:def switch-to-buffer :wk "buffer-list")
  "b s" 'save-buffer
  "b k" 'kill-this-buffer
  "b a" 'beginning-of-buffer
  "b e" 'end-of-buffer

  "w" '(:def nil :wk "windows")
  "w u" '(:def delete-other-windows :window-unique)
  "w o" 'other-window

  "p" '(:def projectile-command-map :wk "projectil")

  "s" '(:def nil :wk "search")
  "s s" 'swiper

  "g" '(:def nil :wk "git")
  "g s" '(:def magit-status :wk "status")

  "o" '(:def nil :wk "org")
  "o o" '(:def (lambda () (interactive) (find-file "~/todo.org")) :wk "org-todo")
  "o s" 'org-store-link
  "o a" 'org-agenda
  "o c" 'org-capture

  "q" '(:def nil :wk "quit")
  "q q" '(:def save-buffers-kill-emacs :wk "quit-emacs")

  "m" '(:def nil :wk "mode"))

(provide 'modal-keys)
