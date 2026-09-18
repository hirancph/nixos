;; -*- lexical-binding: t; -*-

;; Global buffer behavior
(global-display-line-numbers-mode 1)
(recentf-mode 1)

(pixel-scroll-precision-mode 1)

;; Prevent screen jumping when moving cursor down
(setq scroll-step 1)
(setq scroll-conservatively 101)

;; 3-line margin when moving cursor
(setq scroll-margin 3)

;; monospace font for code, tables and UI
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 130
                    :weight 'regular)

;; Proportional font for Org prose and headers
(set-face-attribute 'variable-pitch nil
		    :family "Roboto"
		    :height 1.1
		    :weight 'regular)

;; Load theme
(use-package modus-themes
  :ensure t
  :config
  (modus-themes-load-theme 'modus-vivendi-tinted))

;; Keybinding hints
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

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
