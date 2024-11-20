(use-package helm :ensure t
  :config
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i")  'helm-select-action)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (setq
   ;; open helm buffer inside current window, not occupy whole other window
   helm-split-window-in-side-p           t
   ;; move to end or beginning of source when reaching top or bottom of source.
   helm-move-to-line-cycle-in-source     t
   ;; search for library in `require' and `declare-function' sexp.
   helm-ff-search-library-in-sexp        t
   ;; scroll 8 lines other window using M-<next>/M-<prior>
   helm-scroll-amount                    8
   helm-ff-file-name-history-use-recentf t
   helm-echo-input-in-header-line t
   helm-M-x-reverse-history nil)

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

  (setq helm-autoresize-max-height 50)
  (setq helm-autoresize-min-height 20)

  (space-leader
    "SPC" 'helm-M-x
    "s s" 'helm-occur
    "f f" 'helm-find-files
    "b b" 'helm-buffers-list)

  (helm-mode 1))


(provide 'interface)
