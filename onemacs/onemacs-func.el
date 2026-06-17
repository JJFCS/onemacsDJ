
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; tabs dwim - literally insert 4 spaces - not indentation
	(defun onncera-standard-tab ()
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
	(defun onncera-smart-beginning-of-line ()
		"moves cursor to first non-whitespace char or beg of line. alternates if called repeatedly"
		(interactive)
		(let ((old-point (point)))
			(back-to-indentation)
			(when (= old-point (point))
				(beginning-of-line)))
		)

	;; Remap the standard C-a binding
	(global-set-key [remap move-beginning-of-line] 'onncera-smart-beginning-of-line)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; whitespace mode with trailing line protection
	(defun onncera-set-up-whitespace-handling ()
	(interactive)
	(whitespace-mode)
		(setq-local delete-trailing-lines nil)  ;; stops emacs from deleting empty lines at the bottom of file
		(add-hook 'before-save-hook #'delete-trailing-whitespace nil t)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-func)

