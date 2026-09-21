;; -*- lexical-binding: t; -*-

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode))

(use-package nix-ts-mode
   :ensure t
   :mode "\\.nix\\'")

;; broken treesitter?
;; (use-package kdl-mode
;;   :ensure t
;;   :mode "\\.kdl\\'")

(use-package treesit
  :straight nil 
  :custom
  (treesit-font-lock-level 4))

(use-package treesit-auto
  :ensure t
  :demand t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package eglot
  :ensure nil 
  :hook
  ;; Enable Eglot automatically in target programming modes
  ((python-mode python-ts-mode
    c-mode c++-mode c-ts-mode c++-ts-mode
    js-mode js-ts-mode
    nix-mode nix-ts-mode) . eglot-ensure)
  :custom
  ;; Performance & event optimizations
  (read-process-output-max (* 3 1024 1024))
  (eglot-events-buffer-size 0)
  (eglot-autoshutdown t)
  (eglot-sync-connect 1)
  :config
  (add-to-list 'eglot-server-programs
	       '((nix-mode nix-ts-mode) . ("nixd"))))

;; Render errors
(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :custom
  (flymake-no-changes-timeout 0.5)
  (flymake-fringe-indicator-position 'left-fringe)

  :bind
  (:map flymake-mode-map
	("M-n" . flymake-goto-next-error)
	("M-p" . flymake-goto-prev-error)
	("C-c ! l" . flymake-show-buffer-diagonistics)))

;; Configure built-in Eldoc to display Flymake errors simultaneous in the minibuffer
(use-package eldoc
  :ensure nil
  :custom
  (eldoc-documentation-strategy #'eldoc-documentation-compose)
  (eldoc-echo-area-use-multiline-p 1))

(use-package eldoc-box
  :ensure t
  :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  :custom
  (eldoc-box-max-pixel-width 600)
  (eldoc-box-max-pixel-height 400))

(provide 'init-languages)
