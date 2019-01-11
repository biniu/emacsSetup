
;;; code:

(setq org-agenda-files '("~/Dropbox/ORG_Files/tasks/"))
(global-set-key (kbd "C-c C-a") 'org-agenda)

;; Archive done tasks
(defun channing/archive-when-done ()
  "Archive current entry if it is marked as DONE (see `org-done-keywords')."
  (when (org-entry-is-done-p)
    (org-archive-subtree-default)))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(require 'org-habit)
(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode)
  )

(defvar my-super-agenda-general-groups
      '(
        (:name "Important" :priority "A")
        (:name "Today" :scheduled today)
        (:name "Due today":deadline today)
        (:habit n)
        (:discard (:tag "homeStuff"))
        (:name "Overdue" :deadline past)
        (:name "General":tag "General")
        (:discard (:anything t))
        )
       )


(defun my-super-agenda-general()
  "Generate my super-agenda."
  (interactive)
  (org-super-agenda-mode)
  (let
      ((org-super-agenda-groups my-super-agenda-general-groups))
    (org-todo-list)
    )
  )

(defvar my-super-agenda-home-groups
      '(
        (:name "Home General"
               :tag "HomeGeneral"
               :deadline today)
        (:name "Home Bathroom"
               :tag "HomeBathroom"
               :deadline today)
        (:name "Home Kittchen"
               :tag "HomeKittchen"
               :deadline today)
        (:name "Home Room"
               :tag "HomeRoom"
               :deadline today)
        (:discard (:anything t))

        )
      )

(defun my-super-agenda-home()
  "Generate my super-agenda."
  (interactive)
  (org-super-agenda-mode)
  (let
      ((org-agenda-files "~/Dropbox/ORG_Files/habbits.org"))
      ((org-super-agenda-groups my-super-agenda-home-groups))
    (org-todo-list)
    )
  )

(defvar my-super-agenda-general-projects
  '(
    (:habit n)
    (:name "Emacs" :tag "Emacs")
    (:name "ArchConfig" :tag "ArchConfig")

    (:discard (:anything t))
    )
  )

(defun my-super-agenda-projects()
  "Generate my super-agenda."
  (interactive)
  (org-super-agenda-mode)
  (let
      ((org-super-agenda-groups my-super-agenda-general-projects))
    (org-todo-list)
    )
  )

(use-package toc-org
  :ensure t)

(use-package calfw
  :ensure t)

(use-package calfw-org
  :ensure t)

;(setq org-agenda-files (list "~/Dropbox/ORG_Files/tasks/ArchConfig.org"
;			     "~/Dropbox/ORG_Files/tasks/LongTimeTasks.org"))

(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))


(defun air-org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

(global-set-key (kbd "C-c c")
                'org-capture)

(setq org-capture-templates
      '(
        ("g" "General" entry (file+headline "~/Dropbox/ORG_Files/tasks/General.org" "General")
	 "** TODO %?\nDEADLINE: %^T \n %i\n")
        )
      )

;; JSON EXPORT FUNCTION

(use-package json-mode
  :ensure t)

(require 'json)
(defun org-export-json ()
  (interactive)
  (let* ((tree (org-element-parse-buffer 'object nil)))
    (org-element-map tree (append org-element-all-elements
                                  org-element-all-objects '(plain-text))
      (lambda (x)
        (if (org-element-property :parent x)
            (org-element-put-property x :parent "none"))
        (if (org-element-property :structure x)
            (org-element-put-property x :structure "none"))
        ))
    (write-region
     (json-encode tree)
     nil (concat (buffer-file-name) ".json"))))

(defun cli-org-export-json ()
  (let ((org-file-path (car command-line-args-left))
        (other-load-files (cdr command-line-args-left)))
    (mapc 'load-file other-load-files)
    (find-file org-file-path)
    (org-mode)
    (message "Exporting to JSON: %s" (car command-line-args-left))
(org-export-json)))

;;; Google calendar sync
(setq package-check-signature nil)

(use-package org-gcal
  :ensure t
)

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL")))

;; Start agenda on Sunday
(setq org-agenda-start-on-weekday 0)

(defun my/org-add-ids-to-headlines-in-file ()
  "Add ID properties to all headlines in the current file which
do not already have one."
  (interactive)
  (org-map-entries 'org-id-get-create))

;(add-hook 'org-mode-hook
;          (lambda ()
;            (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)))

;; change priority range
(setq org-highest-priority ?A)
(setq org-lowest-priority ?D)
(setq org-default-priority ?D)

;; add creation date to TODOs
(defun my/log-todo-creation-date (&rest ignore)
  "Log TODO creation time in the property drawer under the key 'CREATED'."
  (when (and (org-get-todo-state)
             (not (org-entry-get nil "CREATED")))
    (org-entry-put nil "CREATED" (format-time-string (cdr org-time-stamp-formats)))))

(advice-add 'org-insert-todo-heading :after #'my/log-todo-creation-date)
(advice-add 'org-insert-todo-heading-respect-content :after #'my/log-todo-creation-date)
(advice-add 'org-insert-todo-subheading :after #'my/log-todo-creation-date)

(add-hook 'org-after-todo-state-change-hook #'my/log-todo-creation-date)


;(advice-add 'org-insert-todo-heading :after #'my/org-add-ids-to-headlines-in-file)
;(advice-add 'org-insert-todo-heading-respect-content :after #'my/org-add-ids-to-headlines-in-file)
;(advice-add 'org-insert-todo-subheading :after #'my/org-add-ids-to-headlines-in-file)

;(add-hook 'org-after-todo-state-change-hook #'my/org-add-ids-to-headlines-in-file)

(add-hook 'before-save-hook 'org-table-recalculate-buffer-tables)

(provide 'el-org)
;;; el-org ends here
