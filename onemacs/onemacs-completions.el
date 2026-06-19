
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; dependencies
	;; > grep
	;; > ripgrep
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; - NOTE: C-o does the toggling in helm-mode
	;; - NOTE: currently using which-key.. to use helm-descbinds, uncomment use-package block below
	;; - TODO: INCLUDE THE FOLLOWING MODULES === HELM-PROJECTILE, HELM-SWOOP, helm-M-x-show-short-doc
	(use-package helm-describe-modes :ensure t)
	(use-package helm :ensure t)
	(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
	(define-key helm-map (kbd "C-j") #'helm-select-action)

	;; (use-package helm-descbinds
	;; 	:ensure t
	;; 	:init (helm-descbinds-mode) (setq prefix-help-command #'helm-descbinds)
	;; )
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	(savehist-mode 1)  ;; To del M-x history navigate to onemacs-cache and delete the "history" file
	(setq backup-directory-alist '(("." . "~/.emacs.d/onemacs-cache/backups")))

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package marginalia :ensure t :init (marginalia-mode) (setq marginalia-align 'right))
	(use-package orderless  :ensure t
		:config
		(setq completion-styles '(orderless basic)
				)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package vertico :ensure t :init (vertico-mode) (vertico-multiform-mode) :config
		(require 'vertico-multiform)
		(setq vertico-multiform-categories '((file (vertico-sort-function . onncera-vertico-find-file))))
		(setq vertico-multiform-commands '(
			(consult-find buffer)
			(consult-grep buffer)
			(consult-line buffer)
			(imenu buffer)
			)
		)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - (setq prefix-help-command #'embark-prefix-help-command) can replace helm-descbinds
	(use-package embark-consult :ensure t)
	(use-package embark         :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - Typical workflow:
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
		:init
		(global-corfu-mode)
		:config
		(setq corfu-auto t)                   ;; disable automatic popup (toggles between t & nil)
		(setq corfu-auto-delay 0.1)
		(setq corfu-auto-prefix 2)
		(setq corfu-cycle t)
		(setq corfu-quit-at-boundary nil)     ;; never quit at completion boundary
		(setq corfu-quit-no-match t)          ;; Quit if no match
		(corfu-popupinfo-mode)                ;; popup information (like company-box)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package cape
		:ensure t
		:init
		(defun onncera/cape-capf-setup ()
		(setq-local completion-at-point-functions
		(list
		(cape-capf-super
			;; #'eglot-completion-at-point  ;; uncomment if you want to use LSP
			#'cape-file
			#'cape-dabbrev)
			#'cape-keyword
		)
		)
		)
		:hook (eglot-managed-mode . onncera/cape-capf-setup) (prog-mode . onncera/cape-capf-setup)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package emacs
		:bind (("C-," . embark-act) ("C-." . embark-dwim))
								)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'onemacs-completions)

