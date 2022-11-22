;; Coisas a serem feitas
;; Este é o significado básico da palavra agenda, vindo do latim
;; agendum. O modo organizacional é muito bom para criar diferentes
;; tipos de agendas ou listas de tarefas, coletando todas as tarefas
;; de um ou mais documentos organizacionais.
(require 'org)

(setq org-directory "~/organiza/")

(setq org-default-notes-file (concat org-directory "notes.org"))

(setq org-capture-templates
      '(("d" "Distracões"
	 entry (file+headline "~/organiza/anotacoes/distracoes.org" "Notas")
	 "* %?\n%T")))

(setq org-adapt-indentation t
      org-hide-leading-stars t
      org-odd-levels-only t)

(setq org-startup-folded t)

(setq org-todo-keywords
      '((sequence "TODO" "DONE")))

(setq org-todo-keyword-faces
      '(("DONE" . "grey")))

(setq org-agenda-skip-timestamp-if-done t)

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

  "p" 'org-set-property)

(provide 'organize)
