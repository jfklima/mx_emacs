(add-to-list 'default-frame-alist
	     '(font . "DejaVu Sans Mono-15"))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package nerd-icons :ensure t)

(use-package zenburn-theme :ensure t
  :config (load-theme 'zenburn t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


(provide 'aparence)
