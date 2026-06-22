
	;; -*- lexical-binding: t; -*-

	;; NOTE - any testing shall be done here

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; packages to explore more:
	;; - nucleo (https://github.com/kn66/nucleo-completion.el)
	;; - yuta   (https://github.com/zenitsu7772000/yuta.el)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; taken from prot (https://protesilaos.com/codelog/2026-04-30-emacs-decent-default-sacha-chua/)
	(use-package dired
	:config
	(setq delete-by-moving-to-trash t)
	(setq dired-create-destination-dirs 'ask)
	(setq dired-create-destination-dirs-on-trailing-dirsep t)  ;; emacs 29
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; taken from prot (https://protesilaos.com/codelog/2026-04-30-emacs-decent-default-sacha-chua/)
	(use-package isearch
	:config
	(setq search-whitespace-regexp ".*?")
	(setq isearch-lax-whitespace t)
	(setq isearch-regexp-lax-whitespace nil)
	(setq isearch-lazy-count t)
	(setq lazy-count-prefix-format "(%s/%s) ")
	(setq lazy-count-suffix-format nil)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; taken from prot (https://protesilaos.com/codelog/2026-04-30-emacs-decent-default-sacha-chua/)
	(use-package diff
	:config
	;; You cannot expect the syntax highlighting of themes to look
	;; equally readabable against what typically are red and green
	;; backgrounds. This should be opt-in by default , not opt-out.
	(setq diff-font-lock-syntax nil)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; taken from prot (https://protesilaos.com/codelog/2026-04-30-emacs-decent-default-sacha-chua/)
	(use-package ediff
	:config
	(setq ediff-split-window-function 'split-window-horizontally)
	(setq ediff-window-setup-function 'ediff-setup-windows-plain)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-testing)

