(add-to-list 'load-path (concat user-emacs-directory "lisp/" ))

(require 'basic)
(require 'packages)
(require 'aparence)
(require 'edit)
(require 'projects)
(require 'interface)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
