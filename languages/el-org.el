
;;; code:

(setq org-agenda-files '("~/Dropbox/ORG_Files/tasks/"))

;; Archive done tasks
(defun channing/archive-when-done ()
  "Archive current entry if it is marked as DONE (see `org-done-keywords')."
  (when (org-entry-is-done-p)
    (org-archive-subtree-default)))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package origami
  :ensure t
  :config
  (origami-mode)
  )

(require 'org-habit)
(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode)
  )

(setq my-super-agenda-groups
      '(

        (:name "Important"
               :priority "A")
        (:name "Today"
               :scheduled today)
        (:name "Due today"
               :deadline today)
        (:habit n)
        (:discard (:tag "homeStuff"))
        (:name "Overdue"
               :deadline past)
        (:name "General"
               :tag "General")
        (:name "Emacs"
               :tag "Emacs")
         )
       )


(defun my-super-agenda()
  "generates my super-agenda"
  (interactive)
  (org-super-agenda-mode)
  (let
      ((org-super-agenda-groups my-super-agenda-groups))
    (org-todo-list)
    )
  )

;(setq org-agenda-custom-commands
;      '(("c" "Super Agenda" agenda
;         (org-super-agenda-mode)
;         ((org-super-agenda-groups
;           '(
;             (:name "Importatnt"
;                    :priority "A")
;             )))
;         (org-agenda nil "a"))))

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

;(setq org-agenda-custom-commands
;      '(("d" "Daily agenda and all TODOs"
;         ((tags "PRIORITY=\"A\""
;                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
;         (agenda "" ((org-agenda-ndays 1)))
;          (alltodo ""
;                   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
;                                                   (air-org-skip-subtree-if-priority ?A)
;                                                   (org-agenda-skip-if nil '(scheduled deadline))))
;                    (org-agenda-overriding-header "ALL normal priority tasks:"))))
;         ((org-agenda-compact-blocks t)))))



(provide 'el-org)
;;; el-org ends here
