
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - not sure if I want
	(use-package git-gutter :ensure t :hook ((prog-mode . git-gutter-mode)))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package pyvenv     :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package magit      :ensure t :defer t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE
	;; dependencies
	;; brew install basedpyright
	;; brew install llvm

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

		;; This makes Eglot and Cape play even better together
		(defun onncera/eglot-capf ()
			(setq-local completion-at-point-functions
				(list (cape-capf-buster #'eglot-completion-at-point))))
		(add-hook 'eglot-managed-mode-hook #'onncera/eglot-capf)
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

