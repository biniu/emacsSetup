
;; Settings

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(package-initialize)

(defvar languages-dir
  (expand-file-name "languages" user-emacs-directory))
(defvar settings-dir
  (expand-file-name "base_setings" user-emacs-directory))
(defvar custom_elisp-dir
  (expand-file-name "custom_elisp" user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path languages-dir)
(add-to-list 'load-path custom_elisp-dir)

(load "~/Dropbox/ORG_Files/emacs.secrets" t)

(require 'el-base-setings)
(require 'el-languages)
(require 'el-custom-elisp)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "76dc63684249227d64634c8f62326f3d40cdc60039c2064174a7e7a7a88b1587" "389c3e3577c21c9588889b3cc00d7d7d1badd073ee2cb39a6e4a123c6147ec85" default)))
 '(helm-descbinds-mode t)
 '(nyan-mode t)
 '(package-selected-packages
   (quote
    (pandoc pocket-reader doom-themes atom-dark-theme buffer-move org-fancy-priorities org-gcal flycheck-pyflakes flycheck-color-mode-line flycheck-pos-tip flycheck-status-emoji flycheck-title flycheck-inline pylint google-translate json-mode git-gutter+ git-gutter rainbow beacon rainbow-delimiters rainbow-mode auto-highlight-symbol highlight-symbol tabbar which-key helm-descbinds helm-system-packages telephone-line nyan-mode org-dashboard helm-dash py-autopep8 org-super-agenda dumb-jump yasnippet-snippets yasnippet helm-rtags magit swiper auto-complete company-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
