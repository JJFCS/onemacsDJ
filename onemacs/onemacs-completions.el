
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; dependencies
	;; > grep
	;; > ripgrep
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	(savehist-mode 1)  ;; To del M-x history navigate to onemacs-cache and delete the "history" file
	(setq backup-directory-alist '(("." . "~/.emacs.d/onemacs-cache/backups")))

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package marginalia :ensure t  :init  (marginalia-mode)  (setq marginalia-align 'right))
	(use-package orderless  :ensure t
		:custom
		(completion-styles '(orderless basic)
				)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package vertico :ensure t :init (vertico-mode) (vertico-multiform-mode) :config
		(require 'vertico-multiform)
		(setq vertico-multiform-categories '((file (vertico-sort-function . onncera-vertico-find-file))))
		(setq vertico-multiform-commands '(
			(consult-find      buffer)
			(consult-grep      buffer)
			(consult-line      buffer)
			(onncera-root-find buffer)
			(onncera-root-grep buffer)
			(imenu buffer)
				)
			)
		(require 'vertico-quick)
			:bind (:map vertico-map
			("C-q"   . vertico-quick-insert) ("M-q" . vertico-quick-exit)
			("C-c s" . vertico-grid-mode)
				)
			)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package embark-consult :ensure t)
	(use-package embark         :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Typical workflow
	;; - consult-ripgrep : "what you are looking for". Transient. once you select a line, other matches gone
	;; - deadgrep		 : creates a dedicated persistent buffer for your search results using ripgrep
	;; - wgrep			 : allows you to make a search result buffer editable

	(use-package consult        :ensure t)
	(use-package deadgrep       :ensure t)
	(use-package wgrep          :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package corfu

		:ensure t
		:custom
		(corfu-auto t)                   ;; disable automatic popup (toggles between t & nil)
		(corfu-auto-delay 0.1)
		(corfu-auto-prefix 2)
		(corfu-cycle t)
		(corfu-quit-at-boundary nil)     ;; never quit at completion boundary
		(corfu-quit-no-match t)          ;; Quit if no match

		:bind
		("C-c h" . completion-at-point)  ;; manual trigger

		:init
		(global-corfu-mode)

		:config
		(corfu-popupinfo-mode)  ;; popup information (like company-box)
	)

	(use-package cape
		:ensure t
		:init
		(defun onncera/cape-capf-setup ()
			(setq-local completion-at-point-functions
				(list  ;; 1. The "Super Capf" merges LSP + Snippets + Files into one menu
				(cape-capf-super
					;; #'eglot-completion-at-point  ;; enable and uncomment if using LSP
					#'cape-file
					#'cape-dabbrev)

					'cape-keyword  ;; 2. Keywords as a fallback
				)
			)
		)
		:hook (eglot-managed-mode . onncera/cape-capf-setup) (prog-mode . onncera/cape-capf-setup)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(require 'consult) (require 'embark)
	(use-package emacs
		:bind (("C-," . embark-act) ("C-." . embark-dwim))
								)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'onemacs-completions)

