(use-package all-the-icons
  :ensure t)

;;;;;;;;;;;;;;;;;;;
;;; COLOR-THEME ;;;
;;;;;;;;;;;;;;;;;;;


(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(require 'doom-themes)

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
(load-theme 'doom-monokai-classic t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'aparence)
