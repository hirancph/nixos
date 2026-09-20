;; -*- lexical-binding: t; -*-

;; auto complete for ( " { [ etc...
(electric-pair-mode 1)

;; Keybinding hints
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Minibuffer completion UI
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Annotations in minibuffer
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Fuzzy completion
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; preview interface
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)))

;; Completion at point
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1))

(provide 'init-completion)
