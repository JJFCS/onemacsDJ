
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package pyvenv :ensure t)
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

