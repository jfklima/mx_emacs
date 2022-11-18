;; Coisas a serem feitas
;; Este é o significado básico da palavra agenda, vindo do latim
;; agendum. O modo organizacional é muito bom para criar diferentes
;; tipos de agendas ou listas de tarefas, coletando todas as tarefas
;; de um ou mais documentos organizacionais.
(require 'org)

(setq org-directory "~/orgs/")

(setq org-default-notes-file (concat org-directory "/organiza.org"))

(setq org-capture-templates
      '(("a" "Todo" entry (file+headline "~/orgs/organiza.org" "Tasks")
	 "* TODO %?\n")))

(setq org-adapt-indentation t
      org-hide-leading-stars t
      org-odd-levels-only t)


(setq org-todo-keywords
      '((sequência "TODO" "DONE")))

(setq org-todo-keyword-faces
      '(("DONE" . "grey")))

(mode-leader
  :keymaps 'org-mode-map
  "t" 'org-todo
  "i" 'org-insert-todo-heading

  "l" 'org-insert-link
  "o" 'org-open-at-point

  "." 'org-time-stamp
  "d" 'org-deadline
  "s" 'org-schedule

  "p" 'org-set-property)

(provide 'organize)
