;; Coisas a serem feitas
;; Este é o significado básico da palavra agenda, vindo do latim
;; agendum. O modo organizacional é muito bom para criar diferentes
;; tipos de agendas ou listas de tarefas, coletando todas as tarefas
;; de um ou mais documentos organizacionais.
(require 'org)

(setq org-directory "~/orgs/")

(setq todo-file (concat org-directory "tarefas.org"))

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
  "t" 'org-todo
  "i" 'org-insert-todo-heading

  "l" 'org-insert-link
  "o" 'org-open-at-point

  "." 'org-time-stamp
  "d" 'org-deadline
  "s" 'org-schedule

  "a" 'org-set-tags-command

  "o" 'org-sort-entries

  "p" 'org-set-property)

(provide 'organize)
