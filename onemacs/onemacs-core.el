
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(when (boundp 'native-comp-eln-load-path)
	(setcar native-comp-eln-load-path
	(expand-file-name "onemacs-cache/eln-cache/" user-emacs-directory)
			)
		)

	(use-package emacs
	    :init
		(add-hook 'emacs-startup-hook #'split-window-horizontally)
		(add-hook 'emacs-startup-hook #'toggle-frame-fullscreen t)
		(add-to-list 'exec-path "/opt/homebrew/bin")
		(electric-pair-mode 1)
		(global-display-line-numbers-mode 1)
		(global-hl-line-mode 1)
		(delete-selection-mode 1)
		(blink-cursor-mode -1)
		(fringe-mode -1)
		(menu-bar-mode -1)
		(scroll-bar-mode -1)
		(tool-bar-mode -1)

		(setq recentf-save-file "~/.emacs.d/onemacs-cache/recentf")
		(setq savehist-file     "~/.emacs.d/onemacs-cache/history")
		(setq auto-save-default nil)
		(setq auto-save-list-file-prefix nil)
		(setq inhibit-splash-screen t)
		(setq locate-command "mdfind")
		(setq display-line-numbers-type 'relative)
		(setq insert-directory-program "gls")
		(setq enable-recursive-minibuffers t)
		(setq lossage-size 1000)
		(setq-default truncate-lines t)

		(put 'upcase-region 'disabled nil)

		:custom
		(standard-indent 4)
		(tab-width 4)
		(indent-tabs-mode nil)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-core)

