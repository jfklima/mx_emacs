(defun subst-char ()
  (interactive)
  (delete-char 1)
  (insert-state))

(defun subst-space()
  (interactive)
  (insert " ")
  (backward-char)
  (insert-state))

(provide 'func)
