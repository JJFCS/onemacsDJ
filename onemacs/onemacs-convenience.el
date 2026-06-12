
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - brew install pkg-config poppler autoconf automake
	(use-package pdf-tools :ensure t
		:mode ("\\.pdf\\'" . pdf-view-mode)
		:config
		(add-hook 'pdf-view-mode-hook
			(lambda ()
				(display-line-numbers-mode -1)
			)
		)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package inhibit-mouse
		:ensure t 
		:config
		(setq inhibit-mouse-excluded-modes '(pdf-view-mode devdocs-mode))  ;; can use mouse in these modes
		(inhibit-mouse-mode 1)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; If want to use for programming modes (prog-mode . indent-bars-mode) place in hook block
	(use-package indent-bars   :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package multiple-cursors :ensure t :defer t
		:init (setq mc/list-file "~/.emacs.d/onemacs-cache/mc-lists.el")
		:bind (
		("M-p" . mc/mark-previous-like-this   )
		("M-n" . mc/mark-next-like-this       )
		("C-<" . mc/skip-to-previous-like-this)
		("C->" . mc/skip-to-next-like-this    )
		)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package move-text

		:ensure t
		:bind (
			("M-<down>" . move-text-down)
			("M-<up>"   . move-text-up)
		)

		:config
		;; Function advice to have Emacs re-indent the text in-and-around a text move
		(defun my/move-text-indent-region-advice (&rest _ignored)
			(let ((deactivate deactivate-mark))
				(if (region-active-p)
					(indent-region (region-beginning) (region-end))
					(indent-region (line-beginning-position) (line-end-position)))
				(setq deactivate-mark deactivate)))
		(advice-add 'move-text-up   :after #'my/move-text-indent-region-advice)
		(advice-add 'move-text-down :after #'my/move-text-indent-region-advice)

	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package vundo   :ensure t :defer t)
	(use-package undo-fu :ensure t
		:bind (
		("C-/" . undo-fu-only-undo)
		("C-?" . undo-fu-only-redo)
		)
	)


	(use-package undo-fu-session
		:ensure t
		:init
		(setq undo-fu-session-directory
			(expand-file-name "onemacs-cache/undo-fu-session/" user-emacs-directory))
		(setq undo-fu-session-incompatible-files '
			("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))

		:config
		(undo-fu-session-global-mode)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'onemacs-convenience)

