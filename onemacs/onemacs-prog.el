
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; dependencies
	;; > brew install basedpyright
	;; > brew install llvm
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - we are using TS so take note of how we modify certain modes
	;; NOTE - once grammars installed, move ---> "~/.emacs.d/onemacs-cache/onemacs-language-grammars"
	(setq treesit-extra-load-path '("~/.emacs.d/onemacs-cache/onemacs-language-grammars"))
	(use-package treesit-auto
		:ensure t
		:config
		(setq treesit-auto-install 'prompt)
		(treesit-auto-add-to-auto-mode-alist 'all)
		(global-treesit-auto-mode)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; whitespace settings
	(setq whitespace-style
		'(face tabs spaces trailing space-before-tab newline indentation space-after-tab
		space-mark tab-mark))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; C      specific settings
	(setq-default c-basic-offset 4)
	(setq-default c-ts-mode-indent-offset 4)
	(add-hook 'c-ts-mode-hook (lambda () (local-set-key (kbd "TAB") #'onncera-standard-tab)))
	(add-hook 'c-ts-mode-hook 'onncera-set-up-whitespace-handling)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;; TODO - maybe can use "C-c q" to insert a tab anywhere regardless that is 4 spaces wide

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Python specific settings
	(setq-default python-indent-offset 4)
	(add-hook 'python-ts-mode-hook (lambda () (local-set-key (kbd "TAB") #'onncera-standard-tab)))
	(add-hook 'python-ts-mode-hook 'onncera-set-up-whitespace-handling)
	(use-package pyvenv     :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package git-gutter :ensure t :hook (prog-mode . git-gutter-mode))
	(use-package magit      :ensure t :defer t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package eglot
		:hook
		(
			(python-ts-mode . eglot-ensure)
			(c-ts-mode      . eglot-ensure)
		)

		:config
		(setq eglot-ignored-server-capabilities '(:inlayHintProvider))

		(add-to-list 'eglot-server-programs
					 '(python-ts-mode . ("basedpyright-langserver" "--stdio")
		)
		)

		(add-to-list 'eglot-server-programs
					 '(c-ts-mode      . ("clangd")
		)
		)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package devdocs    :ensure t
		:config
		(setq devdocs-browser-function #'eww)  ;; force eww renderer (this is to help with font display)
		;; make html inherit emacs faces
		(setq shr-use-fonts  nil)
		(setq shr-use-colors nil)
		(setq devdocs-data-dir (expand-file-name "onemacs-cache/devdocs" user-emacs-directory)
	)
	)

	(use-package projectile :ensure t
		:config
		(setq projectile-known-projects-file "~/.emacs.d/onemacs-cache/projectile-bookmarks.eld")  ;; TODO - is this right?
		(projectile-mode 1)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-prog)

