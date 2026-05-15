
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; creating my own custom theme (Minimal distraction-free black theme)
	(deftheme onncera-minimal-black "A minimal dark theme with white code, grey comments, yellow strings, red TODOs, no italics or bold, permanent hl-line.")
		(custom-theme-set-faces  ;; core face definitions
		'onncera-minimal-black
		'(default ((t (:background "black" :foreground "#EDEADE" :weight normal :slant normal))))  ;; default text
		'(font-lock-comment-face ((t (:foreground "grey50" :slant normal :weight normal))))  ;; comments - grey , no italics
		'(font-lock-string-face ((t (:foreground "#8B8000" :slant normal :weight normal))))   ;; strings  - yellow
		'(font-lock-keyword-face ((t (:foreground "#EDEADE" :slant normal :weight normal))))   ;; Keywords, functions, variables, types → all white
		'(font-lock-function-name-face ((t (:foreground "#EDEADE" :slant normal :weight normal))))
		'(font-lock-variable-name-face ((t (:foreground "#EDEADE" :slant normal :weight normal))))
		'(font-lock-type-face ((t (:foreground "#EDEADE" :slant normal :weight normal))))
		'(hl-line ((t (:background "midnight blue"))))  ;; Highlight current line
		'(region ((t (:background "#333333"))))  ;; Selected region
		'(show-paren-match ((t (:background "#333399"))))  ;; Show paren match
		'(show-paren-mismatch ((t (:background "red"))))
		'(fringe ((t (:background "black"))))  ;; Fringe and line numbers
		'(line-number ((t (:foreground "grey40" :background "black"))))
		'(line-number-current-line ((t (:foreground "#EDEADE" :background "black"))))
	)

	;; NOTE - #EDEADE is basically our version of "white"
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide-theme 'onncera-minimal-black)

