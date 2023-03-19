(require 'ido)
(ido-mode t)

(use-package helm
  :disabled t
  :ensure t
  :diminish ""
  :config
  (require 'helm-config)

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "C-j") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i")  'helm-select-action)
  (define-key helm-map (kbd "<tab>") 'helm-next-page)
  (define-key helm-map (kbd "<backtab>") 'helm-previous-page)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (setq helm-split-window-in-side-p           t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp        t
	helm-scroll-amount                    8
	helm-ff-file-name-history-use-recentf t
	helm-echo-input-in-header-line t)

  (setq helm-M-x-reverse-history t)

  (defun spacemacs//helm-hide-minibuffer-maybe ()
    "Hide minibuffer in Helm session if we use the header line as input field."
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
	(overlay-put ov 'window (selected-window))
	(overlay-put ov 'face
		     (let ((bg-color (face-background 'default nil)))
		       `(:background ,bg-color :foreground ,bg-color)))
	(setq-local cursor-type nil))))

  (add-hook 'helm-minibuffer-set-up-hook
	    'spacemacs//helm-hide-minibuffer-maybe)

  (setq helm-autoresize-max-height 60)
  (setq helm-autoresize-min-height 0)
  (helm-autoresize-mode 1)


  (global-set-key [remap execute-extended-command] 'helm-M-x)
  (global-set-key [remap find-file] 'helm-find-files)
  (global-set-key [remap switch-to-buffer] 'helm-buffers-list)
  (global-set-key [remap isearch-forward] 'helm-occur)

  (helm-mode 1))

(provide 'interface)
