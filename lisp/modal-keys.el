(edit-map
  "m" 'newline
  "o" 'open-line
  "C-j" 'join-line

  "l" 'recenter-top-bottom

  "k" 'kill-line
  "K" 'kill-whole-line
  "y" 'yank

  "u" 'undo
  "U" 'undo-redo

  "d" 'delete-char
  "D" 'kill-word
  "x" 'backward-delete-char
  "X" 'backward-kill-word

  "]" 'scroll-other-window
  "[" 'scroll-other-window-down

  ";" 'comment-line

  "q" 'quit-window

  "Q" 'fill-paragraph

  "z" 'zap-to-char
  "Z" 'zap-up-to-char

  "<" 'kmacro-start-macro
  ">" 'kmacro-end-macro
  "." 'kmacro-end-and-call-macro

  "C" "C-c C-c"

  ;; substitui char
  "s" '(lambda ()
	 (interactive)
	 (progn
	   (delete-char 1)
	   (insert-state)))

  "I" '(lambda ()
	 (interactive)
	 (progn
	   (crux-move-beginning-of-line 1)
	   (insert-state)))

  "A" '(lambda ()
	 (interactive)
	 (progn
	   (end-of-line)
	   (insert-state)))

  "c c" '(lambda ()
	   (interactive)
	   (progn
	     (crux-move-beginning-of-line 1)
	     (kill-line)
	     (insert-state)))

  "c w" '(lambda ()
	   (interactive)
	   (progn
	     (kill-word 1)
	     (insert-state)))

  "S" '(lambda ()
	 (interactive)
	 (progn
	   (kill-line)
	   (insert-state)))

  "O" '(lambda ()
	 (interactive)
	 (crux-smart-open-line-above)
	 (insert-state))

  "ç" "C-x C-x"

  "g" 'keyboard-quit)

(general-def
  :keymaps 'motion
  "b" 'backward-char
  "f" 'forward-char

  "B" 'backward-word
  "F" 'forward-word

  "n" 'next-line
  "p" 'previous-line

  "a" 'crux-move-beginning-of-line
  "e" 'move-end-of-line

  "j" 'avy-goto-char
  "," 'avy-goto-char-in-line

  ;; register
  "r r" 'point-to-register
  "r j" 'jump-to-register

  "v" 'scroll-up-command
  "V" 'scroll-down-command)

(general-def
  :keymaps 'visual
  "w" 'kill-region
  "W" 'kill-ring-save
  ";" 'uncomment-region
  "g" 'keyboard-quit)

(space-leader
  "SPC" '(:def execute-extended-command :wk "M-x")

  "TAB" '(:def (lambda ()
		 (interactive)
		 (switch-to-buffer (other-buffer)))
	       :wk "last-buffer")

  "h" '(:def nil :wk "help")
  "h" help-map

  "o" '(:def nil :wk "org")

  "o o" '(:def (lambda ()
		 (interactive)
		 (find-file "~/orgs/tarefas.org"))
	       :wk "org-todo")

  "o s" 'org-store-link
  "o a" '(lambda () (interactive) (org-agenda t "a"))
  "o c" 'org-capture

  "o d" '(lambda () (interactive)
	   (org-agenda t "a"))

  "f" '(:def nil :wk "files")
  "f f" '(:def find-file :wk "find-file")
  "f i" '(:def (lambda ()
		 (interactive)
		 (find-file (concat user-emacs-directory "init.el")))
	       :wk "open-init")

  "o C" '(:def (lambda ()
		 (interactive)
		 (find-file (concat user-emacs-directory "/lisp/organize.el")))
	       :wk "org-config")


  "b" '(:def nil :wk "buffer")
  "b b" '(:def switch-to-buffer :wk "buffer-list")
  "b s" 'save-buffer
  "b S" 'save-some-buffers
  "b k" 'kill-this-buffer
  "b a" 'beginning-of-buffer
  "b e" 'end-of-buffer
  "b i" 'ibuffer

  "w" '(:def nil :wk "windows")
  "w u" '(:def delete-other-windows :window-unique)
  "w o" 'other-window
  "w h" 'split-window-horizontally
  "w v" 'split-window-vertically

  "p" '(:def projectile-command-map :wk "projectil")

  "s" '(:def nil :wk "search")
  "s s" 'isearch-forward

  "p" '(:def nil :wk "projects")
  "p p" 'projectile-switch-project
  "p f" 'projectile--find-file
  "p d" 'projectile-find-dir
  "p D" 'project-dired
  "p D" 'projectile-dired
  "p s" 'project-shell
  "p b" 'projectile-switch-to-buffer
  "p K" 'projectile-kill-buffers

  "g" '(:def nil :wk "git")
  "g s" '(:def magit-status :wk "status")

  "l" '(:def nil :wk "bookmarks")
  "l a" 'bookmark-set
  "l l" 'bookmark-jump
  "l m" 'list-bookmarks
  "l s" 'bookmark-save

  "j" '(:def nil :wk "jump")
  "j w" 'avy-goto-word-1
  "j SPC" 'avy-goto-char-2

  "q" '(:def nil :wk "quit")
  "q q" '(:def save-buffers-kill-emacs :wk "quit-emacs")

  "m" '(:def nil :wk "mode"))

(provide 'modal-keys)
