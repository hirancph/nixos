;; -*- lexical-binding: t; -*-

;; undo package for vim
(use-package undo-fu
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-keybinding nil) ; Required by evil-collection
  (setq evil-normal-state-cursor 'box
        evil-insert-state-cursor 'bar
        evil-visual-state-cursor 'hollow)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Enable cursor shape changes specifically for terminal Emacs
;; Enable terminal cursor shape changes for Evil mode in -nw
(unless (display-graphic-p)
  (use-package evil-terminal-cursor-changer
    :ensure t
    :config
    (etcc-on)))

(provide 'init-evil)
