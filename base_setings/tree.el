
(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) '(setq neo-theme (if (display-graphic-p) 'icons 'arrow))icons 'arrow)))

(provide 'tree)
(use-package all-the-icons)
