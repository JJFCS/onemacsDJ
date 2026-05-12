
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; - TODO: INCLUDE THE FOLLOWING MODULES === HELM-LSP, HELM-PROJECTILE, HELM-SWOOP, HELM-C-YASNIPPET
;;									HELM-DESCBINDS
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
	(defun onncera-root-find () (interactive)
		(let ((project-root (projectile-project-root))
			)
				(if project-root
					(consult-find project-root)
				(message "NOT IN A PROJECT ---> CREATE .GIT OR .PROJECTILE")
		)
		)
		)
	(defun onncera-root-grep () (interactive)
		(let ((project-root (projectile-project-root))
			)
				(if project-root
					(consult-grep project-root)
				(message "NOT IN A PROJECT ---> CREATE .GIT OR .PROJECTILE")
		)
		)
		)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package embark-consult :ensure t)
	(use-package embark         :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package consult        :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company-box :ensure t)
(use-package company 	 :ensure t

	:init
	(global-company-mode 1)

	:config

	(setq company-box-doc-delay 0.100)

	(setq company-tooltip-annotation-padding 3) (setq company-tooltip-align-annotations t)

	(setq company-minimum-prefix-length 2)
	(setq company-idle-delay 0.1)

	(setq company-tooltip-minimum-width 100)
	(setq company-tooltip-maximum-width 120)

	;; (setq company-backends '(

	;; 	company-abbrev
	;; 	company-capf
    ;;     company-clang
    ;;     company-dabbrev
    ;;     company-dabbrev-code
    ;;     company-etags
    ;;     company-gtags
    ;;     company-files
    ;;     company-keywords
	;; 	company-yasnippet

	;; 	)
    ;; )

	:hook
	(company-mode . company-box-mode)

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

