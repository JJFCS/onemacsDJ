
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
							(load-theme 'nvim-dark t)

						)
		)
						)
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; NOTE - The general veto settings apply to all themes. The non-general is only for nvim dark theme
	(defconst onncera-colors
		'(
		(onncera-background    . "#060606")
		(onncera-bghl          . "#36454F")
		(onncera-blue          . "#78AFFF")
		(onncera-grey          . "#8E9292")
		(onncera-main          . "#FFDD33")
		(onncera-mode          . "#2B2B2B")
		(onncera-pink          . "#CB2F80")
		(onncera-green-cooler  . "#73c936")
		(onncera-green-warmer  . "#5E8759")
		(onncera-purple-cooler . "#AF9FFF")
		(onncera-purple-warmer . "#9676AC")
		(onncera-quartz        . "#95A99F")
		(onncera-brown         . "#CC8C3C")
		(onncera-white         . "#EDEADE")
		(onncera-red           . "#F43841")
		)
	)


	(defun onncera-color (name)
	"return color NAME from `onncera-colors'"
		(alist-get name onncera-colors))


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


	(defun onncera/theme-settings-veto ()
	"place my preferred theme preferences"

		;; testing area
		(set-face-attribute 'default nil :foreground (onncera-color 'onncera-white))
		(set-face-attribute 'ansi-color-blue nil :foreground (onncera-color 'onncera-blue))
		(set-face-attribute 'font-lock-builtin-face nil :foreground (onncera-color 'onncera-main))
		(set-face-attribute 'font-lock-comment-face nil :foreground (onncera-color 'onncera-grey))
		(set-face-attribute 'font-lock-comment-delimiter-face nil :foreground (onncera-color 'onncera-grey))
		(set-face-attribute 'font-lock-keyword-face nil :foreground (onncera-color 'onncera-main))
		(set-face-attribute 'font-lock-variable-name-face nil :foreground (onncera-color 'onncera-white))
		(set-face-attribute 'font-lock-function-name-face nil :foreground (onncera-color 'onncera-white))
		(set-face-attribute 'font-lock-string-face nil :foreground (onncera-color 'onncera-brown))
		(set-face-attribute 'font-lock-doc-face nil :foreground (onncera-color 'onncera-green-warmer))
		(set-face-attribute 'cursor nil :background (onncera-color 'onncera-main))
		(set-face-attribute 'helm-selection nil :background (onncera-color 'onncera-mode))

		;; hl-line
		(when (facep 'hl-line) (set-face-attribute 'hl-line nil :background "midnight blue"))

	)


	(defun onncera/theme-settings (&rest _)
	"run theme overrides safely after theme changes"

	(run-at-time 0 nil (lambda () (onncera/theme-settings-veto-general)  ;; always apply
	(when (member 'nvim-dark custom-enabled-themes)  ;; only for nvim dark theme
	(onncera/theme-settings-veto)))))

	(advice-add 'load-theme   :after #'onncera/theme-settings)
	(advice-add 'enable-theme :after #'onncera/theme-settings)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide 'onemacs-supreme)

