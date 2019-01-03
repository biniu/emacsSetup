
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
