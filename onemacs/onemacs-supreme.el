
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(use-package autothemer :ensure t)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;  even though we name the file "supreme" this is only meant for theme settings

		(use-package leuven-theme :ensure t) (use-package ef-themes       :ensure t)
		(use-package modus-themes :ensure t) (use-package standard-themes :ensure t)
		(use-package doric-themes :ensure t) (use-package doom-themes     :ensure t)

		(use-package gruber-darker-theme     :ensure t)
		(use-package jetbrains-darcula-theme :ensure t)

		(use-package nvim-dark-theme
		:vc (:url "https://github.com/mang-jin/emacs-theme-nvim-dark"
		:rev :newest))

		(add-to-list 'custom-theme-load-path
			(expand-file-name "onemacs-theme" user-emacs-directory))

		(add-hook 'window-setup-hook	(lambda ()
		(run-with-idle-timer 0 nil	(lambda ()
							;; (load-theme 'onncera-minimal-black t)  ;; fav == "doom-xcode"
							;; (load-theme 'gruber-darker t)
							(load-theme 'jetbrains-darcula t)

						)
		)
						)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-supreme)

