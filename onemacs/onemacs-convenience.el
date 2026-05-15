
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Tip : once you press C-= once, just press either "=" to grow region or "-" to contract region
	(use-package expand-region :ensure t :bind ("C-=" . er/expand-region))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; an alternative to the built-in Emacs help that provides much more contextual information

	(use-package helpful

		:ensure t
		:bind
		([remap describe-command]  . helpful-command)
		([remap describe-key]      . helpful-key)
		([remap describe-symbol]   . helpful-symbol)
		([remap describe-function] . helpful-callable)
		([remap describe-variable] . helpful-variable)

	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; once in iedit mode, select a region & hit C-; again to restrict the search area to the region
	;; Finish - by pressing C-; again
	(use-package iedit         :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Just disables the mouse. toggle the mode to keep it on/off
	(use-package inhibit-mouse :ensure t :config (inhibit-mouse-mode 1))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package indent-bars   :ensure t
		:hook (
		(python-mode . indent-bars-mode)
			)
		)
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

