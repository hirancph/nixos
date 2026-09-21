;; -*- lexical-binding: t; -*-

;; Global buffer behavior
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq-default display-line-numbers-grow-only nil)
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-width-start nil)
(setq-default truncate-lines t)
(recentf-mode 1)

(setq use-short-answers t)

;;(pixel-scroll-precision-mode 1) ;; Don't enable: this was causing very fast scrolling

(setq scroll-error-top-bottom t)

;; replacement for pixel-scroll-precision-mode (I guess)
;; Scroll one line at a time and map modifier keys to specific actions.
(setq mouse-wheel-scroll-amount
      '(1
        ((shift) . hscroll) ((meta))
        ((control meta) . global-text-scale)
        ((control) . text-scale)))
(setq mouse-wheel-progressive-speed nil);; Prevent scroll acceleration spikes
(setq mouse-wheel-follow-mouse 't);; Scroll window under mouse cursor

;; Prevent screen jumping when moving cursor down
(setq scroll-step 1)
(setq scroll-conservatively 20)
(setq scroll-preserve-screen-position t)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling t)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

;; Allow scrolling actions while remaining inside a search block.
(setq isearch-allow-scroll 'unlimited)

;; 3-line margin when moving cursor
(setq scroll-margin 3)

;; horizontal scrolling
(setq hscroll-margin 2
      hscroll-step 1)

;; Stop blinking cursor
(blink-cursor-mode 0)

;; Skip some fontification when input is pending
(setq redisplay-skip-fontification-on-input t)

;; using custom-theme-set-faces to set cursor colour to not get overriden by modus
(custom-theme-set-faces
 'user
 ;; Cursor Color Override
 '(cursor             ((t (:background "#c0caf5")))))

;; monospace font for code, tables and UI
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 140
                    :weight 'regular)

;; Proportional font for Org prose and headers (not used anymore)
(set-face-attribute 'variable-pitch nil
		    :family "Roboto"
		    :height 1.1
		    :weight 'regular)

;; Load theme
(use-package modus-themes
  :ensure t
  :config
  (modus-themes-load-theme 'modus-vivendi-tinted))

;; setting colours from nano-modeline to the default modeline
;; Force active mode line colors
(set-face-attribute 'mode-line-active nil
                    :foreground "#ffffff"
                    :background "#1d2235"
                    :box '(:line-width 1 :color "#0d0e1c"))

;; Force inactive mode line colors (used when M-: is focused)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#626a7a"
                    :background "#13161f"
                    :box '(:line-width 1 :color "#0d0e1c"))

;; Modeline
(use-package nano-modeline
  :ensure t
  :init
  (setq nano-modeline-position 'nano-modeline-footer)
  :config
  (nano-modeline-text-mode t)
  (nano-modeline-prog-mode t))

(provide 'init-ui)
