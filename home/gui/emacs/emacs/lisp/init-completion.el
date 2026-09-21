;; -*- lexical-binding: t; -*-

;; auto complete for ( " { [ etc...
(electric-pair-mode 1)

;; Keybinding hints
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Embark for contextual actions
(use-package embark
  :ensure t
  :bind
  (("C-a"   . embark-act) 
   ("C-;"   . embark-dwim) 
   ("C-h B" . embark-bindings))   

  :init
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 (display-buffer-at-bottom)
                 (window-parameters (mode-line-format . nil)))))

(use-package wgrep
  :ensure t
  :custom
  (wgrep-auto-save-buffer t)
  (wgrep-change-readonly-file t))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

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

(use-package cape
  :ensure t
  :init
  ;; Add backends to the global completion hook
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-keyword))

(provide 'init-completion)
