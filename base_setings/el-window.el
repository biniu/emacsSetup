
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;; windows size
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; moving windows
(global-set-key (kbd "<C-M-up>") 'buf-move-up)
(global-set-key (kbd "<C-M-down>") 'buf-move-down)
(global-set-key (kbd "<C-M-left>") 'buf-move-left)
(global-set-key (kbd "<C-M-right>") 'buf-move-right)

(provide 'el-window)
