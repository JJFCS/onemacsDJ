
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; ;; remove all italics , disable bold , set highlight line color
	;; (defun onncera/remove-all-italics ()
	;; "disable italics in all faces"
	;; (dolist (face (face-list)) (when (face-attribute face :slant nil 'default) (set-face-attribute face nil :slant 'normal)))
	;; 	)


	;; (defun onncera/apply-theme-overrides ()
	;; "onncera's preferred face settings"
	;; 	;; disable italics
	;; 	(set-face-attribute 'font-lock-comment-face nil
	;; 		:slant 'normal)
	;; 	(set-face-attribute 'font-lock-doc-face nil
	;; 		:slant 'normal)
	;; 	(set-face-attribute 'italic nil
	;; 		:slant 'normal)
	;; 	(onncera/remove-all-italics)

	;; 	;; disable bold
	;; 	(set-face-attribute 'bold nil
	;; 		:weight 'normal)

	;; 	;; hl-line
	;; 	(when (facep 'hl-line) (set-face-attribute 'hl-line nil :background "midnight blue"))
	;; )


	;; (defun onncera/theme-settings (&rest _)
	;; 	"run theme overrides safely after theme changes"
	;; 	(run-at-time 0 nil #'onncera/apply-theme-overrides)
	;; )

	;; (advice-add 'enable-theme :after #'onncera/theme-settings)
	;; (advice-add 'load-theme   :after #'onncera/theme-settings)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

