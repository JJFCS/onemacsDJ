
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;  even though we name the file "supreme" this is only meant for theme settings

		(use-package leuven-theme :ensure t) (use-package ef-themes       :ensure t)
		(use-package modus-themes :ensure t) (use-package standard-themes :ensure t)
		(use-package doric-themes :ensure t) (use-package doom-themes     :ensure t)

		(use-package nvim-dark-theme
		:vc (:url "https://github.com/mang-jin/emacs-theme-nvim-dark"
		:rev :newest))

		(add-to-list 'custom-theme-load-path
			(expand-file-name "onemacs-theme" user-emacs-directory))

		(add-hook 'window-setup-hook	(lambda ()
		(run-with-idle-timer 0 nil	(lambda ()
							(load-theme 'onncera-minimal-black t)  ;; fav == "doom-xcode"
							(set-face-background hl-line-face "midnight blue")
							(set-face-italic 'font-lock-comment-face nil)
							(set-face-bold-p 'bold                   nil)

						)
		)
						)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-supreme)

