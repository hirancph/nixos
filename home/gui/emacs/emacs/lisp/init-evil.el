;; -*- lexical-binding: t; -*-

;; undo package for vim
(use-package undo-fu
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-keybinding nil) ; Required by evil-collection
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(provide 'init-evil)
