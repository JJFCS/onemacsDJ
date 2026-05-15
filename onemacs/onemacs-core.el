
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera-sane ()
		(electric-pair-mode 1) (global-display-line-numbers-mode 1) (global-hl-line-mode 1) (delete-selection-mode 1)
		(blink-cursor-mode -1) (fringe-mode -1)  (menu-bar-mode -1) (scroll-bar-mode    -1) (tool-bar-mode        -1)
	)


	(when (boundp 'native-comp-eln-load-path)
	(setcar native-comp-eln-load-path
	(expand-file-name "onemacs-cache/eln-cache/" user-emacs-directory)
			)
		)


	(use-package emacs
		:init
		(add-hook 'emacs-startup-hook  'split-window-horizontally)
		(add-hook 'emacs-startup-hook  'toggle-frame-fullscreen t)
		(add-hook 'emacs-startup-hook  'onncera-sane t)
		(add-to-list    'exec-path "/opt/homebrew/bin")
	(setq recentf-save-file "~/.emacs.d/onemacs-cache/recentf")
	(setq savehist-file     "~/.emacs.d/onemacs-cache/history")
	(setq auto-save-default nil) (setq auto-save-list-file-prefix nil)
	(setq-default truncate-lines t)
	(setq inhibit-splash-screen  t)
	(setq display-line-numbers-type 'relative) (setq insert-directory-program "gls")
	:custom
	(tab-width 4)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(setq locate-command "mdfind")  ;; only for macOS - use spotlight for locate
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; In terminal mode , keep long lines on one line
	(add-hook 'term-mode-hook (lambda () (setq-local truncate-lines t)))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package exec-path-from-shell
	:ensure t
	:if (and (display-graphic-p)
		(eq system-type 'darwin))
	:demand t
	:config
	(setq exec-path-from-shell-variables '("PATH"))
	(exec-path-from-shell-initialize)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-core)

