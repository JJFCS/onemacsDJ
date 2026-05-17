
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(require 'autothemer)

	(autothemer-deftheme
	onncera "onncera's personal emacs theme"

	((((class color) (min-colors #xFFFFFF)))  ;; only concerned about GUI emacs

	;; defining our color palette
	(onncera-background         "#060606")
	(onncera-bghl               "#36454F")
	(onncera-blue               "#78AFFF")
	(onncera-grey               "#8E9292")
	(onncera-main               "#FFDD33")
	(onncera-mode               "#2B2B2B")
	(onncera-pink               "#CB2F80")
	(onncera-green-cooler       "#73c936")
	(onncera-green-warmer       "#5E8759")
	(onncera-purple-cooler      "#AF9FFF")
	(onncera-purple-warmer      "#9676AC")
	(onncera-quartz             "#95A99F")
	(onncera-brown              "#CC8C3C")
	(onncera-white              "#FFFFFF")
	(onncera-red                "#F43841")

	)


	;; TODO - minibuffer theme settings
	;; customise faces (ONLY MEANT FOR PYTHON - CREATE ANOTHER SET FOR OTHER LANGUAGES BASED ON PREFERENCE)
	(
	(default                          (:foreground onncera-white        :background onncera-background))
	(font-lock-builtin-face           (:foreground onncera-main         :background onncera-background))
	(font-lock-comment-face           (:foreground onncera-grey         :background onncera-background))
	(font-lock-comment-delimiter-face (:foreground onncera-grey         :background onncera-background))
	(font-lock-keyword-face           (:foreground onncera-main         :background onncera-background))
	(font-lock-variable-name-face     (:foreground onncera-white        :background onncera-background))
	(font-lock-function-name-face     (:foreground onncera-white        :background onncera-background))
	(font-lock-string-face            (:foreground onncera-brown        :background onncera-background))
	(font-lock-constant-face          (:foreground onncera-pink         :background onncera-background))
	(font-lock-doc-face               (:foreground onncera-green-warmer :background onncera-background))
	(font-lock-doc-string-face        (:foreground onncera-green-warmer :background onncera-background))
	(cursor                           (:background onncera-main))
	(region                           (:background onncera-bghl))
	(show-paren-match                 (:foreground onncera-red          :background onncera-background))
	(show-paren-mismatch              (:foreground onncera-red          :background onncera-background))
	(isearch                          (:foreground onncera-background   :background onncera-pink))
	(lazy-highlight                   (:foreground onncera-brown        :background onncera-brown))
	(line-number                      (:foreground onncera-brown        :background onncera-background))
	(line-number-current-line         (:foreground onncera-red          :background onncera-background))
	(mode-line                        (:foreground onncera-white        :background onncera-mode))
	(mode-line-inactive               (:foreground onncera-white        :background onncera-mode))
	)

	;; next language here..

	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(provide-theme 'onncera)

