(add-to-list 'load-path (concat user-emacs-directory "lisp/" ))

(require 'basic)
(require 'packages)
(require 'aparence)
(require 'modal-mac)
(require 'edit)
(require 'projects)
(require 'interface)
(require 'modal-keys)
(require 'organize)
(require 'programming)
(require 'util)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(progn
  (org-agenda t "a")
  (delete-other-windows))
