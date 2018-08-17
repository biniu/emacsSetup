
;;; Code:
(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  )

(use-package ac-helm
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'ac-complete-with-helm)
  (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
  )

(use-package helm-gitignore
  :ensure t)

(use-package helm-rtags
  :ensure t)

(use-package helm-system-packages
  :ensure t)

(provide 'el-helm)
;;; el-helm ends here
