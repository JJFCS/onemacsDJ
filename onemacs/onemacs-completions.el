
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; - TODO: INCLUDE THE FOLLOWING MODULES === HELM-PROJECTILE, HELM-SWOOP, HELM-DESCBINDS
	;;									helm-M-x-show-short-doc
	(use-package helm-describe-modes :ensure t)
	(use-package helm :ensure t
			:bind (
		([remap find-file] . helm-find-files) ([remap yank-pop] . helm-show-kill-ring)
	)
	)
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


	;; 	;; If you ever want to go for that telescope look in neovim where the
	;; 	;; popup is in the middle of the screen. Play around with the code below.
	;; 	;; Can make use of asking AI as well to polish the code.


	;; 	(use-package vertico :ensure t :init (vertico-mode) (vertico-multiform-mode) :config
	;; 		(require 'vertico-multiform)
	;; 		(setq vertico-multiform-commands '(
	;; 			(consult-find      buffer)
	;; 			(consult-grep      buffer)
	;; 			(consult-line      buffer)
	;; 			(onncera-root-find buffer)
	;; 			(onncera-root-grep buffer)
	;; 			(imenu buffer)
	;; 				)
	;; 			)
	;; 		(require 'vertico-quick)
	;; 			:bind (:map vertico-map
	;; 			("C-q"   . vertico-quick-insert) ("M-q" . vertico-quick-exit)
	;; 			("C-c s" . vertico-grid-mode)
	;; 				)

	;; 		:custom
	;; 			(vertico-resize t)  ;; allows dynamic resizing
	;; 			(vertico-cycle  t)  ;; cycle candidates
	;; 			(vertico-count 20)  ;; The number of visible candidates

	;; 			)


	;; 	;; ----------------------------
	;; 	;; Posframe
	;; 	;; floating child frames
	;; 	;; ----------------------------
	;; 	(use-package posframe :ensure t)

	;; 	;; ----------------------------
	;; 	;; Vertico Posframe
	;; 	;; centered floating minibuffer
	;; 	;; ----------------------------
	;; 	(use-package vertico-posframe :ensure t :after vertico

	;; 		:custom

	;; 		;; Fallback if childframes unsupported
	;; 		(vertico-posframe-fallback-mode 'vertico-buffer-mode)

	;; 		;; Dimensions
	;; 		(vertico-posframe-width 120)
	;; 		(vertico-posframe-height 16)

	;; 		;; Prevent weird shrinking
	;; 		(vertico-posframe-min-width 120)
	;; 		(vertico-posframe-min-height 16)

	;; 		;; center on screen
	;; 		(vertico-posframe-poshandler #'posframe-poshandler-frame-center)

	;; 		;; Border
	;; 		(vertico-posframe-border-width 1)

	;; 		:config
	;; 		(vertico-posframe-mode 1)

	;; 	)

	;; 	;; ----------------------------
	;; 	;; Telescope-like appearance
	;; 	;; ----------------------------

	;; (custom-set-faces
	;; 	'(vertico-posframe
	;; 		((t (:background "#1e1e2e"
	;; 		     :foreground "#cdd6f4"))))

	;; 	'(vertico-posframe-border
	;; 		((t (:foreground "#6c7086"))))

	;; 	'(vertico-current
	;; 		((t (:background "#313244"
	;; 			 :foreground "#f5e0dc"
	;; 			 :weight bold))))

	;; 	'(marginalia-documentation
	;; 		((t (:foreground "#7f849c"))))

	;; 	'(minibuffer-prompt
	;; 		((t (:foreground "#89b4fa"
	;; 			 :weight bold)))))

	;; 	;; ----------------------------
	;; 	;; optional:
	;; 	;; slightly higher popup uncomment if desired
	;; 	;; ----------------------------

	;; 	;; (setq vertico-posframe-poshandler
	;; 	;;       #'posframe-poshandler-frame-center-near-top)
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
		(corfu-auto nil)                 ;; disable automatic popup
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
		(corfu-popupinfo-mode)  ;; enable Corfu popup information (the replacement for company-box doc)
	)

	(use-package cape
		:ensure t
		:init
		(defun onncera/cape-capf-setup ()
			(setq-local completion-at-point-functions
				(list  ;; 1. The "Super Capf" merges LSP + Snippets + Files into one menu
				(cape-capf-super
					#'eglot-completion-at-point
					#'cape-file
					#'cape-dabbrev)

					'cape-keyword  ;; 2. Keywords as a fallback
				)
			)
		)
		:hook (eglot-managed-mode . onncera/cape-capf-setup)
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
	(define-key helm-map (kbd "C-j") #'helm-select-action)
	(require 'consult) (require 'embark)
	(use-package emacs
		:bind (("C-," . embark-act) ("C-." . embark-dwim))
								)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'onemacs-completions)

