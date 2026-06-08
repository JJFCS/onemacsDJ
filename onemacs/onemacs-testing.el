
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; testing org mode things
	(use-package olivetti
		:ensure t
		:hook (org-mode . olivetti-mode)

		:init
		;; Custom function to enable olivetti only for specific extensions
		(defun onncera-enable-olivetti-by-extension ()
		(when (and buffer-file-name 
			(string-match-p "\\.txt\\'" buffer-file-name))
			(olivetti-mode)
			)
		)

		;; run this check whenever a file is loaded
		(add-hook 'find-file-hook #'onncera-enable-olivetti-by-extension)

		:config
		;; The "Nuclear Option": Force the reset function to be safe
		;; This overwrites the broken internal calculation with a safe 'nil' (default)
		(defun olivetti-reset-window (window)
			(when (window-live-p window)
				(set-window-margins window nil)
				(set-window-fringes window nil nil)
				(set-window-parameter window 'split-window nil)
			)
		)
	)

	(use-package org-bullets :ensure t :hook (org-mode . org-bullets-mode))

	(with-eval-after-load 'org
		(set-face-attribute 'org-level-1 nil :weight 'bold :height 1.00)
		(set-face-attribute 'org-level-2 nil :weight 'bold :height 1.00)
		(set-face-attribute 'org-level-3 nil :weight 'bold :height 1.00)
		(set-face-attribute 'org-level-4 nil :weight 'bold :height 1.00)

		(set-face-attribute 'variable-pitch nil
			:font "MartianMono Nerd Font Mono"
			:height 140)
		(add-hook 'org-mode-hook #'variable-pitch-mode)  ;; enable variable-pitch in org buffers
	)

	(add-hook 'org-mode-hook 'visual-line-mode)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-testing)

