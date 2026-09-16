;; -*- lexical-binding: t; -*-

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Don't show the splash screen
(setq inhibit-startup-message t)

;; Remove visual bloat
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Set Jetbrains Mono Nerd Font
(set-face-attribute 'default nil
		    :family "JetBrainsMono Nerd Font"
		    :height 130
		    :weight 'regular)

;; Load doom-themes
(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-dream t))

;; Most recently edited file
(recentf-mode 1)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package nano-modeline
  :ensure t
  :init
  (setq nano-modeline-position 'nano-modeline-footer)
  :config
  (nano-modeline-text-mode t)
  (nano-modeline-prog-mode t))

;; Verical completion UI for things like M-x C-x b
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Marginalia adds useful information for completions, like docstrings, keybinds, etc...
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Orderless enables better searching
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Consult gives live previews for Search and buffer navigation
(use-package consult
  :ensure t
  :bind (;; Replacement for standard commands
	 ("C-x b" . consult-buffer))) ; switch buffer with live previews

;; Corfu gives the floating auto-completion at cursor
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult corfu doom-modeline doom-themes marginalia nano-modeline
	     orderless vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
