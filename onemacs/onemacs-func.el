
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera-highlight-todo ()
		"bright red TODO keywords"
		(font-lock-add-keywords nil '(("\\<TODO\\>" 0 '(:foreground "red" :weight bold) t)))
	)

	(add-hook 'prog-mode-hook #'onncera-highlight-todo)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera-root-find () (interactive)
		(let ((project-root (projectile-project-root))
			)
				(if project-root
					(consult-find project-root)
				(message "NOT IN A PROJECT ---> CREATE .GIT OR .PROJECTILE")
		)
		)
		)
	(defun onncera-root-grep () (interactive)
		(let ((project-root (projectile-project-root))
			)
				(if project-root
					(consult-grep project-root)
				(message "NOT IN A PROJECT ---> CREATE .GIT OR .PROJECTILE")
		)
		)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun smart-beginning-of-line ()
		"moves cursor to first non-whitespace char or beg of line. alternates if called repeatedly"
		(interactive)
		(let ((old-point (point)))
			(back-to-indentation)
			(when (= old-point (point))
				(beginning-of-line)))
		)

	;; Remap the standard C-a binding
	(global-set-key [remap move-beginning-of-line] 'smart-beginning-of-line)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-func)

