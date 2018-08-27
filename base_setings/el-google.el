
;;; Code:

(use-package google-translate
  :ensure t
  :config
  (global-set-key (kbd "C-c t") 'google-translate-query-translate)
  )

(provide 'el-google)
;;; el-google.el ends here
