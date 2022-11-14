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

(provide 'modal-keys)
