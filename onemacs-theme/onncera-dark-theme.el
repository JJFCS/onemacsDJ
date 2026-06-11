
	;;; onncera-dark-theme.el --- An Emacs theme that looks like neovim's default theme with my personal taste -*- lexical-binding: t -*-

	;; NvimDarkBlue     #004c63     rgb(0,76,115)       RGB_(0x00, 0x4c, 0x73)
	;; NvimDarkCyan     #007373     rgb(0,115,115)      RGB_(0x00,0x73,0x73)
	;; NvimDarkGreen    #005523     rgb(0,85,35)        RGB_(0x00,0x55,0x23)
	;; NvimDarkMagenta  #470045     rgb(71,0,69)        RGB_(0x47,0x00,0x45)
	;; NvimDarkRed      #590008     rgb(89,0,8)         RGB_(0x59,0x00,0x08)
	;; NvimDarkYellow   #6b5300     rgb(107,83,0)       RGB_(0x6b,0x53,0x00)
	;; NvimLightBlue    #A6DBFF     rgb(166,219,255)    RGB_(0xa6,0xdb,0xff)
	;; NvimLightCyan    #8cf8f7     rgb(140,248,247)    RGB_(0x8c,0xf8,0xf7)
	;; NvimLightGreen   #b4f6c0     rgb(179, 246, 192)  RGB_(0xb3, 0xf6, 0xc0)
	;; NvimLightMagenta #FFCAFF     rgb(255, 202, 255)  RGB_(0xff, 0xca, 0xff)
	;; NvimLightRed     #FFC0B9     rgb(255, 192, 185)  RGB_(0xff, 0xc0, 0xb9)
	;; NvimLightYellow  #FCE094     rgb(252, 224, 148)  RGB_(0xfc, 0xe0, 0x94)
	;; NvimLightGrey1   #EEF1F8     rgb(238,241,248)    RGB_(0xee, 0xf1, 0xf8)
	;; NvimLightGrey2   #E0E2EA     rgb(224, 226, 234)  RGB_(0xe0, 0xe2, 0xea)
	;; NvimLightGrey3   #C4C6CD     rgb(196, 198, 205)  RGB_(0xc4, 0xc6, 0xcd)
	;; NvimLightGrey4   #9b9ea4     rgb(155, 158, 164)  RGB_(0x9b, 0x9e, 0xa4)
	;; NvimDarkGrey4    #4f5258     rgb(79,82,88)       RGB_(0x4f,0x52,0x58)
	;; NvimDarkGrey3    #2c2e33     rgb(44,46,51)       RGB_(0x2c,0x2e,0x33)
	;; NvimDarkGrey2    #14161B     rgb(20,22,27)       RGB_(0x2c,0x2e,0x33)
	;; NvimDarkGrey1    #07080D     rgb(7,8,13)         RGB_(0x07,0x08,0x0d)


	(deftheme onncera-dark "onncera's customised version of neovim's dark theme")

	(let ((bg            "#14161B")
		  (whitespace1   "#585858")
		  (whitespace2   "#9E95C7")
		  (bghl          "#36454F")
		  (blue          "#78AFFF")
		  (grey          "#8E9292")
		  (line          "#2C2E33")
		  (main          "#FFDD33")
		  (mode          "#2B2B2B")
		  (pink          "#CB2F80")
		  (type)
		  (green-cooler  "#73C936")
		  (green-warmer  "#5E8759")
		  (purple-cooler "#AF9FFF")
		  (purple-warmer "#9676AC")
		  (quartz        "#95A99F")
		  (string        "#B4F6C0")
		  (brown         "#CC8C3C")
		  (error         "#FFC0B9")
		  (white         "#EDEADE")
		  (tabbg         "#2C2E33")
		  (tabfg         "#C4C6CD")
		  (red           "#F43841")
		  (region        "#4F5258")
		  (warning       "#FCE094")
		  (mismatch      "#590008")
		  (constant)
		  (keyword)
		)

	(custom-theme-set-faces 'onncera-dark

	;; TODO - keyword might be replaced with "main"
	;; main things
	`(default   ((t (:background ,bg :foreground ,white))))
	`(cursor    ((t (:background ,main))))
	`(region    ((t (:background ,region))))
	`(highlight ((t (:background ,region))))
	`(fringe    ((t (:background ,bg :foreground ,white))))
	`(minibuffer-prompt ((t (:foreground ,keyword))))  ;; could include :weight bold

	;; line number
	`(line-number ((t (:background ,bg :foreground ,grey))))
	`(line-number-current-line ((t (:background ,line :foreground ,white :weight bold))))

	;; syntax highlighting
	`(font-lock-comment-face ((t (:foreground ,grey))))
	`(font-lock-keyword-face ((t (:foreground ,main :weight bold))))
	`(font-lock-builtin-face ((t (:foreground ,main))))
	`(font-lock-warning-face ((t (:foreground ,warning :weight bold))))
	`(font-lock-function-name-face ((t (:foreground ,white))))
	`(font-lock-function-call-face ((t (:foreground ,white))))
	`(font-lock-variable-name-face ((t (:foreground ,white))))
	`(font-lock-constant-face ((t (:foreground ,constant))))
	`(font-lock-preprocessor-face ((t (:foreground ,keyword :weight bold))))
	`(font-lock-type-face ((t (:foreground ,type))))
	`(font-lock-string-face ((t (:foreground ,brown))))

	;; mode line
	`(mode-line ((t (:background ,region :foreground ,white))))
	`(mode-line-inactive ((t (:background ,line :foreground ,grey))))

	;; tab-bar-mode
	`(tab-bar ((t (:background ,tabbg))))
	`(tab-bar-tab ((t (:background ,bg :foreground ,white :weight bold))))
	`(tab-bar-tab-inactive ((t (:background ,tabbg :foreground ,tabfg))))

	;; tab-line-mode
	`(tab-line ((t (:background ,tabbg))))
	`(tab-line-tab-current  ((t (:background ,bg    :foreground ,white :weight bold))))
	`(tab-line-tab-inactive ((t (:background ,tabbg :foreground ,tabfg))))

	;; paren match
	`(show-paren-match ((t (:background ,region :foreground ,white :weight bold))))
	`(show-paren-mismatch ((t (:background ,mismatch :foreground ,white))))

	;; search
	`(isearch        ((t (:background ,warning :foreground ,bg :weight bold))))
	`(lazy-highlight ((t (:background ,region  :foreground ,white))))
	`(ido-only-match ((t (:foreground ,string  :weight bold))))

	;; error/warning
	`(error   ((t (:foreground ,error   :weight bold))))
	`(warning ((t (:foreground ,warning :weight bold))))
	`(success ((t (:foreground ,string  :weight bold))))

	;; whitespace-mode
	`(whitespace-space            ((t (:background ,bg          :foreground ,whitespace1))))
	`(whitespace-tab              ((t (:background ,bg          :foreground ,whitespace1))))
	`(whitespace-hspace           ((t (:background ,bg          :foreground ,whitespace2))))
	`(whitespace-newline          ((t (:background ,bg          :foreground ,whitespace2))))
	`(whitespace-line             ((t (:background ,whitespace2 :foreground ,red))))
	`(whitespace-space-after-tab  ((t (:background ,main        :foreground ,main))))
	`(whitespace-space-before-tab ((t (:background ,brown       :foreground ,brown))))
	`(whitespace-trailing         ((t (:background ,red         :foreground ,red))))
	`(whitespace-indentation      ((t (:background ,main        :foreground ,red))))

	;; highlight line
	`(hl-line ((t (:background "midnight blue"))))


	)
	)


	(provide-theme 'onncera-dark)

	;;; onncera-dark-theme.el ends here

