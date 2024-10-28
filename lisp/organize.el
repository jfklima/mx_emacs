;; Coisas a serem feitas
;; Este é o significado básico da palavra agenda, vindo do latim
;; agendum. O modo organizacional é muito bom para criar diferentes
;; tipos de agendas ou listas de tarefas, coletando todas as tarefas
;; de um ou mais documentos organizacionais.
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
(setq org-agenda-start-day "-0d")
(setq org-agenda-start-on-weekday nil)

;; não mostra na agenda tarefas concluídas
(setq org-agenda-skip-timestamp-if-done t)

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

  "p" '(:def org-set-property :wk "set-property"))

(provide 'organize)
