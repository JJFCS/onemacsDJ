
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defvar onncera-key-display "" "Holds the string of the last pressed key and its command.")
	(defvar onncera-last-logged-keys nil "Tracks the last logged keys sequences")  ;; Tracking variables to filter duplicates
	(defvar onncera-last-logged-cmd  nil "Tracks the last logged command symbol")  ;; Tracking variables to filter duplicates

	(defun onncera-format-command (cmd) "Convert CMD symbol into human-readable text"
		(if (symbolp cmd)
			(truncate-string-to-width
			(replace-regexp-in-string "-" " " (symbol-name cmd))
			50 nil nil "...")
				"anonymous lambda")
			)

	(defun onncera-log-key-to-buffer (log-text) "Appends LOG-TEXT to the *Key Log* buffer and keeps point at the end"
		(let ((buf (get-buffer-create "*command binding history*")))
	    (with-current-buffer buf
			(unless (eq major-mode 'fundamental-mode)
			(fundamental-mode))
			(display-line-numbers-mode)
				(let ((moving-point (= (point) (point-max))))
				(save-excursion
					(goto-char (point-max))
					(insert log-text "\n")

					;; limits the file to 1000 lines
					(let ((line-count (count-lines (point-min) (point-max))))
					(when (> line-count 1000)
						(goto-char (point-min))
						;; Find the boundary of the oldest lines we want to drop
						(forward-line (- line-count 1000))
						(delete-region (point-min) (point))
					)
					)
					)

					(when moving-point
					(goto-char (point-max)
					)
					)
					)
			)
			)
	)

	(defun onncera-update-key-display () "Update key display *before* every command runs, filtering duplicates"
		;; FIX: if we are actively in the *command binding history* buffer, don't log anything!
		;; This prevents navigation keys (like next-line) from polluting the log
		(unless (eq (current-buffer) (get-buffer "*command binding history*"))
		(let* ((raw-keys (this-command-keys-vector))
			(keys (key-description raw-keys)) 
			(cmd  this-command))
      
		(unless (string-empty-p keys)
		(unless (and (equal raw-keys onncera-last-logged-keys)
			(eq cmd onncera-last-logged-cmd))
          
			(setq onncera-last-logged-keys raw-keys)
			(setq onncera-last-logged-cmd cmd)
          
			(setq onncera-key-display
				(if cmd
					(format "%s → %s" keys (onncera-format-command cmd))
					(format "%s" keys)))
          
			(onncera-log-key-to-buffer onncera-key-display)
			(force-mode-line-update)
		)
		)
		)
		)
	)

	;; Reset tracking variables when idle
	(add-hook 'post-command-hook (lambda () 
		(setq onncera-last-logged-keys nil
		      onncera-last-logged-cmd  nil
		)
		)
	)

	;; 1. Run on pre-command-hook for maximum key accuracy
	(add-hook 'pre-command-hook #'onncera-update-key-display)

	;; 2. Ensure minibuffer commands are caught
	(defun onncera-setup-minibuffer-key-display () "Ensure our key display updates inside the minibuffer."
	(add-hook 'pre-command-hook #'onncera-update-key-display nil t))
	(add-hook 'minibuffer-setup-hook #'onncera-setup-minibuffer-key-display)

	;; 3. Your header-line configuration (optimized slightly)
	(setq-default header-line-format
	'((:eval
	(let ((text onncera-key-display))
		(unless (string-empty-p text)
		(concat
		(propertize
			" "
			'display
			`(space :align-to
				(- right-fringe
				,(1+ (string-width text))
				)
			)
		)
	    	     text)
				)
			)
		))
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; remove  every line in the command binding history buffer that contains "self insert command"
	;; command only works in the command binding history buffer
	(defun onncera-remove-self-insert-command-lines ()
		(interactive)
		(if (string= (buffer-name) "*command binding history*")
			(progn
				(beginning-of-buffer)
				(flush-lines "self insert command"))
		(user-error "error: you are not in *command binding history* buffer")
		)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

