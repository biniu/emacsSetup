
(use-package anaconda-mode
:ensure t
:config
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  )

(provide 'python_settings)