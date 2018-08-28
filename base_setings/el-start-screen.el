
(use-package projectile
  :ensure t)

(use-package dashboard
:ensure t
:config
  (dashboard-setup-startup-hook)
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  ;; Set the banner
  ; (setq dashboard-startup-banner [VALUE])
  ;; Value can be
  ;; 'official which displays the official emacs logo
  ;; 'logo which displays an alternative emacs logo
  ;; 1, 2 or 3 which displays one of the text banners
  ;; "path/to/your/image.png which displays whatever image you would prefer
  (setq dashboard-items '((recents  . 5)
                    (bookmarks . 5)
                    (projects . 5)
                    (agenda . 5)
                    (registers . 5)))
  )

(provide 'el-start-screen)
