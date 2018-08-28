
;;; Code:

(defun c-open-general ()
  "Open general task file."
  (interactive)
  (split-window-vertically)
  (find-file "~/Dropbox/ORG_Files/tasks/General.org")
  )

(defun c-open-learning ()
  "Open general task file."
  (interactive)
  (split-window-vertically)
  (find-file "~/Dropbox/ORG_Files/tasks/Learning.org")
  )

(defun c-open-tasks ()
  "Open general task file."
  (interactive)
  (split-window-vertically)
  (find-file "~/Dropbox/ORG_Files/tasks/")
  )


(provide 'el-custom-cmd)
;;; el-custom-cmd.el ends here
