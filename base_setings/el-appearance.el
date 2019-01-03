
;; http://ergoemacs.org/emacs/emacs_make_modern.html
;; auto insert closing bracket
(electric-pair-mode 1)
;; make cursor movement stop in between camelCase words.
(global-subword-mode 1)
;; make typing delete/overwrites selected text
(delete-selection-mode 1)
;; turn on highlighting current line
(global-hl-line-mode 1)
;; turn on bracket match highlight
(show-paren-mode 1)
;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)
;; remove tool bar
(tool-bar-mode -1)
;; remove menu bar
(menu-bar-mode -1)
;; always show line numbers
(setq linum-format " %4d \u2502 ") ;; Set solid separator for line number
(global-linum-mode 1)
;; when a file is updated outside emacs, make it update if it's already
;: opened in emacs
(global-auto-revert-mode 1)
;; Type y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; remove trailling white spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
 )

; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package origami
  :ensure t)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; TODO
;; set a default font
(when (member "DejaVu Sans Mono" (font-family-list))
(set-face-attribute 'default nil :font "DejaVu Sans Mono-10"))


;; 80-column rule
(use-package fill-column-indicator
:ensure t
:config
    (setq fci-rule-color "cyan")
     (add-hook 'prog-mode-hook 'fci-mode)
)

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1)
  )

(use-package which-key
  :ensure t
  :config
  (which-key-mode t)
  )

(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode 1)
  )

(use-package beacon
  :ensure t
  :config
  (beacon-mode t)
  )

(use-package rainbow-mode
  :ensure t
  :config
  (rainbow-mode t)
  )

(use-package buffer-move
  :ensure t
  :config
  )

(use-package rotate
  :ensure t)

(display-time-mode 1)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;; Custom theme
;;(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
;;(load-theme 'dark-cyan t)

(use-package doom-themes
  :ensure t)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)



;; show white sapces
;;
(whitespace-mode 1)
(global-whitespace-mode 1)

(provide 'el-appearance)
;;; el-appearance.el ends here
