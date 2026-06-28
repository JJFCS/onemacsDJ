
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - builtin commands are bound directly
	;; NOTE - package-specific commands are wrapped in (with-eval-after-load 'package-feature ...)
	;;        to stay safe regardless of load order / deferred loading
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; super cool and important commands/keybindings
	;; - view-lossage            (C-h l)
	;; - view-echo-area-messages (C-h e)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; TODO - setup keybindings..
	(defvar onncera/a-map (make-sparse-keymap) "onncera C-c a prefix")
	(global-set-key (kbd "C-c a") onncera/a-map)
	(define-key onncera/a-map (kbd "a") #'avy-goto-char)
	(define-key onncera/a-map (kbd "c") #'completion-at-point)  ;; corfu provides the UI, command is builtin
	(define-key onncera/a-map (kbd "h") #'view-lossage)
	(define-key onncera/a-map (kbd "q") #'onncera-standard-tab)
	(define-key onncera/a-map (kbd "s") #'avy-goto-line)
	(define-key onncera/a-map (kbd "t") #'ansi-term)

	;; example for non builtin commands
	;; b - (reserved, example only, uncomment + fill in when needed)
	;; (with-eval-after-load 'magit
	;;   (define-key onncera/a-map (kbd "b") #'magit-status))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-keybindings)

