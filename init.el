
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

(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-pomodoro yasnippet-snippets which-key use-package try toc-org telephone-line sphinx-doc rotate rainbow-mode pylint pyenv-mode py-autopep8 pocket-reader pandoc origami org-super-agenda org-gcal org-fancy-priorities org-dashboard org-bullets neotree md4rd magit json-mode importmagic hydra hungry-delete helm-system-packages helm-rtags helm-projectile helm-mt helm-gitignore groovy-mode google-translate flycheck-pyflakes flycheck-inline fill-column-indicator dumb-jump doom-themes dashboard counsel cmake-ide clang-format calfw-org calfw buffer-move beacon auto-highlight-symbol ace-window ac-helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
