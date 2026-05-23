
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; dependencies
	;; > homebrew
	;; > brew install basedpyright
	;; > brew install llvm
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; once grammars installed, move ---> "~/.emacs.d/onemacs-cache/onemacs-language-grammars"
	(setq treesit-extra-load-path '("~/.emacs.d/onemacs-cache/onemacs-language-grammars"))
	(use-package treesit-auto :ensure t
			:custom
			(treesit-auto-install 'prompt)
			:config
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
	(add-hook 'c-mode-hook #'whitespace-mode)
	(add-hook 'c-mode-hook 'onncera/set-up-whitespace-handling)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;; TODO - maybe can use "C-c q" to insert a tab anywhere regardless that is 4 spaces wide

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; GO     specific settings TODO - indents are super weird now..
	(use-package go-mode :ensure t)
	(add-hook 'go-mode-hook #'whitespace-mode)
	(add-hook 'go-mode-hook (lambda () (setq indent-tabs-mode nil)))
	(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "TAB") #'onncera-go-tab)))
	(add-hook 'go-mode-hook 'onncera/set-up-whitespace-handling)

	;; Prefer tree-sitter mode if available
	(if (fboundp 'go-ts-mode) (add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode)))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Python specific settings
	(setq-default python-indent-offset 4)
	(add-hook 'python-mode-hook #'whitespace-mode)
	(add-hook 'python-mode-hook (lambda () (local-set-key (kbd "TAB") #'onncera-python-tab)))
	(add-hook 'python-mode-hook 'onncera/set-up-whitespace-handling)
	(use-package pyvenv     :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package git-gutter :ensure t :hook ((prog-mode . git-gutter-mode)))
	(use-package magit      :ensure t :defer t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
		:config
		(setq devdocs-browser-function #'eww)  ;; force eww renderer (this is to help with font display)
		;; make html inherit emacs faces
		(setq shr-use-fonts  nil)
		(setq shr-use-colors nil)
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

