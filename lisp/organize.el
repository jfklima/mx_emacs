(require 'org)

(setq org-directory "~/org/")
(setq todo-file (concat org-directory "todo.org"))

;; (setq org-default-notes-file (concat org-directory "tarefas.org"))
(setq org-default-notes-file todo-file)

(defun todo ()
  (interactive)
  (find-file todo-file))

;; ajusta a visualização hierarquica
(setq org-adapt-indentation t
      org-hide-leading-stars t
      org-odd-levels-only t)

;; abre o arquivo org com todas as heading fechadas
(setq org-startup-folded t)

;; marcações para acompanhar o fluxo de trabalho
(setq org-todo-keywords
      '((sequence "TODO" "DONE")))

(setq org-todo-keyword-faces
      '(("DONE" . "grey")))

;; mostra a agenda do dia atual
(setq org-agenda-span 'day)
;; mostra semana a partir do dia atual - ver a frente
(setq org-agenda-start-day "-0d")
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)

;; não mostra na agenda tarefas concluídas
(setq org-agenda-skip-timestamp-if-done t)


(space-leader
  "o" '(:def nil :wk "org")

  "o t" '(:def (lambda ()
		 (interactive)
		 (find-file todo-file))
	       :wk "org-todo")

  "o s" 'org-store-link
  "o a" '(lambda () (interactive) (org-agenda t "a"))
  "o c" 'org-capture

  "o d" '(lambda () (interactive)
	   (org-agenda t "a")))


;; mapa de teclado para o org-mode
(mode-leader
  :keymaps 'org-mode-map
  "t" '(:def org-todo :wk "todo")
  "i" '(:def org-insert-todo-heading :wk "insert-todo-heading")

  "l" '(:def org-insert-link :wk "insert-link")
  "o" '(:def org-open-at-point :wk "open-at-point")

  "." '(:def org-time-stamp :wk "time-stamp")
  "d" '(:def org-deadline :wk "deadline")
  "s" '(:def org-schedule :wk "schedule")

  "a" '(:def org-set-tags-command :wk "set-tags-command")

  "o" '(:def org-sort-entries :wk "sort-entries")

  "[" 'org-agenda-file-to-front
  "]" 'org-remove-file

  "p" '(:def org-set-property :wk "set-property"))


(provide 'organize)
