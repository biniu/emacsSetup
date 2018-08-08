
;; Settings

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar languages-dir
  (expand-file-name "languages" user-emacs-directory))
(defvar settings-dir
  (expand-file-name "base_setings" user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path languages-dir)

(require 'base_setings)
(require 'el-languages)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("389c3e3577c21c9588889b3cc00d7d7d1badd073ee2cb39a6e4a123c6147ec85" default)))
 '(package-selected-packages
   (quote
    (py-autopep8 org-super-agenda dumb-jump yasnippet-snippets yasnippet helm-rtags magit swiper auto-complete company-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
