
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; when in devdocs can use mouse , anywhere else and we enable inhibit mouse mode
	(add-hook
		'window-selection-change-functions
		(lambda (_frame)
			(if (derived-mode-p 'devdocs-mode)
				(inhibit-mouse-mode -1)
				(inhibit-mouse-mode 1)))
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; tabs dwim - literally insert 4 spaces - not indentation
	(defun onncera-python-tab ()
		(interactive) (insert "    ")
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; tabs dwim - literally insert 4 spaces - not indentation
	(defun onncera-go-tab ()
		(interactive) (insert "    ")
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera-vertico-find-file (candidates)
	"Sort CANDIDATES by dotfiles first, then dot-dirs, then files, then dirs (all in alphabetical order)"
		;; speed up file operations during sorting.. emacs has a ton of background checks. Turn them off
		(let ((file-name-handler-alist nil))
			(sort candidates
			(lambda (a b)
			(let* (
				(a-dot (string-prefix-p "." a))  ;; checks if file "a" starts with a dot. If it does, true
				(b-dot (string-prefix-p "." b))  ;; do the same for the below
				(a-dir (string-suffix-p "/" a))  ;; so for any two items, emacs knows is it a dotfile or a dir
				(b-dir (string-suffix-p "/" b))
			)

			(cond  ;; now we have our sorting rules
			;; rule 1 : place "." and ".." always stay at the very top
			((string-match-p "\\`\\.\\.?/\\'" a) t)
			((string-match-p "\\`\\.\\.?/\\'" b) nil)

			;; rule 2 : priortise dotfiles over regular files
			((and a-dot (not b-dot)) t)
			((and (not a-dot) b-dot) nil)


			;; rule 3 : Within dotfiles, prefer files over directories
			((and a-dot b-dot)
				(if (and (not a-dir) b-dir) t
					(if (and a-dir (not b-dir)) nil
						(string< a b))))

			;; rule 4 : Within regular files, prefer files over directories
			(t
				(if (and (not a-dir) b-dir) t
					(if (and a-dir (not b-dir)) nil
						(string< a b))))))))))
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
					(consult-ripgrep project-root)
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
	;; whitespace mode with trailing line protection
	(defun onncera/set-up-whitespace-handling ()
	(interactive)
	(whitespace-mode 1)
		;; Prevent Emacs from deleting empty lines at the bottom of the file
		(setq-local delete-trailing-lines nil)  ;; stops emacs from deleting empty lines at the bottom of file
		(add-to-list 'write-file-functions 'delete-trailing-whitespace)
	)
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

