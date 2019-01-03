

(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/bin/zsh")
  )

(use-package helm-mt
  :ensure t
  )



;(add-hook 'term-mode-hook
;          (lambda ()
;            (setq term-buffer-maximum-size 10000)))

;(add-hook 'term-mode-hook
;          (lambda ()
;            (setq show-trailing-whitespace nil)
;            (autopair-mode -1)))

;(add-hook 'term-mode-hook
;          (lambda ()
;            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;(set-window-buffer (selected-window) (shell-get-buffer-create))

(provide 'el-shell)
