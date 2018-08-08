
;; Base SetUP

(use-package company
:ensure t
:config
    (add-hook 'after-init-hook 'global-company-mode)
  )

(require 'python_settings)

(provide 'languages)
