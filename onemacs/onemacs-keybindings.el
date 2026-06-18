
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; TODO - setup keybindings..
	(defvar onncera/a-map (make-sparse-keymap) "onncera C-c a prefix")
	(global-set-key (kbd "C-c a") onncera/a-map)

	;; (define-key onncera/a-map (kbd "a") #'some-command)
	;; (define-key onncera/a-map (kbd "b") #'some-other-command)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-keybindings)

