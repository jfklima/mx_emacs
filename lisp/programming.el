(unless (package-installed-p 'helm-dash)
  (package-install 'helm-dash))

(require 'helm-dash)

(defun python-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Python 3")))

(add-hook 'python-mode-hook 'python-doc)

(provide 'programming)
