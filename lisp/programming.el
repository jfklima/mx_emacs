(unless (package-installed-p 'helm-dash)
  (package-install 'helm-dash))

(require 'helm-dash)

(defun python-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Python 3")))

(add-hook 'python-mode-hook 'python-doc)

(defun ruby-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Ruby")))

(add-hook 'ruby-mode-hook 'ruby-doc)

(provide 'programming)
