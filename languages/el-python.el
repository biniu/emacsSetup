
(use-package py-autopep8
  :ensure t)

(use-package pylint
  :ensure t)

(use-package flycheck-pyflakes
  :ensure t)

(use-package pyenv-mode
  :ensure t)

(use-package importmagic
    :ensure t
    :config
    (add-hook 'python-mode-hook 'importmagic-mode))

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(provide 'el-python)
