
;; Basic programing settings

;; Auto completion
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))


;; on the fly syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package flycheck-inline
  :ensure t
  :config
  (flycheck-inline-mode t)
  )

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package dumb-jump
  :ensure t
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'helm))

(use-package origami
  :ensure t
  :bind (("M-o a c" . origami-close-all-nodes)
         ("M-o c" . origami-close-node)
         ("M-o o" . origami-open-node)
         ("M-o a o" . origami-open-all-nodes))
  :config
  (origami-mode t)
  )

(use-package projectile
  :ensure t
  :config
  (projectile-mode t)
  (setq projectile-enable-caching t)
  )

(use-package hydra
  :ensure t)

(defhydra dumb-jump-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back"))


(require 'el-org)
(require 'el-python)
(require 'el-cmode)

(provide 'el-languages)
