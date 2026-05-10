
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package pyvenv :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;; remove if you do not want to use LSP

	(use-package eglot
		:hook
		(
			(python-mode . eglot-ensure)
			(c-mode      . eglot-ensure)
		)

		:config	
		(setq eglot-ignored-server-capabilities '(:inlayHintProvider))

		(add-to-list 'eglot-server-programs
					 '(python-mode . ("basedpyright-langserver" "--stdio")
		)
		)

		(add-to-list 'eglot-server-programs
					 '(c-mode      . ("clangd")
		)
		)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package dumb-jump  :ensure t)
	(use-package devdocs    :ensure t
		:custom (devdocs-data-dir (expand-file-name "onemacs-cache/devdocs" user-emacs-directory)
	)
	)
	(use-package projectile :ensure t
		:config
		(setq projectile-known-projects-file "~/.emacs.d/onemacs-cache/projectile-bookmarks.eld")
		(projectile-mode 1)
	)
		(add-hook 'xref-backend-functions #'dumb-jump-xref-activate) (dumb-jump-mode)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-prog)

