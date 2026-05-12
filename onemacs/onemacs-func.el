
	;; -*- lexical-binding: t; -*-

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

