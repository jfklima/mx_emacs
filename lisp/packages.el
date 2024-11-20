(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(setq package-check-signature nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-compute-statistics t)
(setq use-package-always-ensure t)

(use-package diminish
  :ensure t)

(use-package try :ensure t)

(provide 'packages)
