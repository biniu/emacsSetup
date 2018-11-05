
;;(use-package ggtags
;;  :ensure t
;; :config
;;  (add-hook 'c-mode-common-hook
;;	    (lambda ()
;;	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;		(ggtags-mode 1))))
;;  )

(use-package cmake-ide
  :ensure t
  :config
  (cmake-ide-setup))

(use-package clang-format
  :ensure t
  :config
  (setq clang-format-style-option "llvm")
  )

(provide 'el-cmode)
