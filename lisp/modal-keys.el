(motion-map
  "b" 'backward-char
  "f" 'forward-char

  "B" 'backward-word
  "F" 'forward-word

  "a" 'beginning-of-line
  "e" 'move-end-of-line

  "p" 'previous-line
  "n" 'next-line

  "l" 'recenter-top-bottom

  "A" 'backward-sentence
  "E" 'forward-sentence

  "P" 'backward-paragraph
  "N" 'forward-paragraph

  "v" 'scroll-up-command
  "V" 'scroll-down-command

  ;; register
  "r r" 'point-to-register
  "r j" 'jump-to-register)


(edit-map
  "m" 'newline
  "o" 'open-line
  "C-j" 'join-line

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

  "ç" "C-x C-x"

  "g" 'keyboard-quit)


(visual-map
  "w" 'kill-region
  "W" 'kill-ring-save
  ";" 'comment-region
  "g" 'keyboard-quit)


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

  "f R" 'rename-file
  "f w" 'write-file
  "f D" 'delete-file

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
