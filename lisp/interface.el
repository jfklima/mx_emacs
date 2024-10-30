(use-package counsel :ensure t
  :config
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d) "
	ivy-height 17
	ivy-wrap t)

  (define-key ivy-minibuffer-map (kbd "RET") 'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-immediate-done)

  (space-leader
    "s s" 'swiper-isearch
    "s ." 'swiper-isearch-thing-at-point)

  (ivy-mode +1))


(provide 'interface)
