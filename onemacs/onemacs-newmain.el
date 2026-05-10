
	;; -*- lexical-binding: t; -*-

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


(provide 'onemacs-newmain)

