
	;; -*- lexical-binding: t; -*-

	;; even though we name the file "supreme" this is only meant for theme settings
	;; cool themes:
	;; - doom-badger
	;; - doom-homage-black
	;; - doom-monokai-pro
	;; - doom-monokai-spectrum
	;; - nvim-dark
	;; - onncera-dark
	;; - pixel-themes-alia16
	;; - standard-dark
	;; - turbo-c

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		(use-package leuven-theme :ensure t :defer t) (use-package ef-themes       :ensure t :defer t)
		(use-package modus-themes :ensure t :defer t) (use-package standard-themes :ensure t :defer t)
		(use-package doric-themes :ensure t :defer t) (use-package doom-themes     :ensure t :defer t)

		(use-package gruber-darker-theme     :ensure t :defer t)
		(use-package jetbrains-darcula-theme :ensure t :defer t)
		(use-package nordic-night-theme      :ensure t :defer t)

		(use-package turbo-c-theme
			:vc (:url "https://github.com/Senka07/turboc-emacs-theme"
			:rev :newest)
		)

		(use-package pixel-themes
			:vc (:url "https://github.com/lucasobx/pixel-themes"
			:rev :newest)
		)

		(use-package nvim-dark-theme
			:vc (:url "https://github.com/mang-jin/emacs-theme-nvim-dark"
			:rev :newest)
		)

		(add-to-list 'custom-theme-load-path
		(expand-file-name "onemacs-theme" user-emacs-directory))

		(add-hook 'window-setup-hook	(lambda ()
		(run-with-idle-timer 0 nil	(lambda ()
							(load-theme 'doom-monokai-pro t)

						)
		)
						)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera/theme-settings-veto-general ()
	"remove italics , disable bold , set highlight line color"
	(dolist (face (face-list)) (when (face-attribute face :slant nil 'default) (set-face-attribute face nil :slant 'normal)))
		;; disable italics
		(set-face-attribute 'font-lock-comment-face nil
			:slant 'normal)
		(set-face-attribute 'font-lock-doc-face nil
			:slant 'normal)
		(set-face-attribute 'italic nil
			:slant 'normal)
		;; disable bold
		(set-face-attribute 'bold nil
			:weight 'normal)
		;; hl-line
		(when (facep 'hl-line) (set-face-attribute 'hl-line nil :background "midnight blue"))
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(defun onncera/theme-settings (&rest _) "run theme overrides safely after theme changes"
		(run-at-time 0 nil (lambda () (onncera/theme-settings-veto-general)  ;; Implement for every single theme
			)
		)
	)

	(advice-add 'load-theme   :after #'onncera/theme-settings)
	(advice-add 'enable-theme :after #'onncera/theme-settings)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-supreme)

