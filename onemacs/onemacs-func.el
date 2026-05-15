
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera-highlight-todo ()
		"Highlight important annotation keywords."
		(font-lock-add-keywords nil `((,(concat "\\<" (regexp-opt '("TODO" "FIXME" "BUG" "NOTE")) "\\>")
			0
			'(:foreground "red" :weight bold)
			t
				)
			)
		)
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


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; ONLY WHEN USING BERKELEY MONO FONT
	(defun swap-display-table-chars (from-char to-char display-table)
		(aset display-table from-char (vector to-char))
		(aset display-table to-char (vector from-char))
	)

	(defun setup-swap-display-table ()
		(let ((current-font (face-attribute 'default :family)) (dt  (or buffer-display-table  (make-display-table))))
		(when (string= current-font "Berkeley Mono Trial")
			(swap-display-table-chars ?# ?*  dt)
			(swap-display-table-chars ?/ ?\\ dt)
			(swap-display-table-chars ?\\ ?/ dt)
			(setq buffer-display-table dt)))
	)

	(add-hook 'text-mode-hook 'setup-swap-display-table)
	(add-hook 'prog-mode-hook 'setup-swap-display-table)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-func)

