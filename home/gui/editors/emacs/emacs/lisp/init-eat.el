;; -*- lexical-binding: t; -*-

(use-package eat
  :ensure t
  :bind
  (("C-c t" . eat)
   :map eat-semi-char-mode-map
   ("C-y" . eat-yank)
   ("M-y" . eat-yank-pop))
  :custom
  (eat-enable-mouse t)
  (eat-term-name "xterm-256color")
  (eat-kill-buffer-on-exit t)
  :hook
  (eshell-load . eat-eshell-mode)
  (eshell-load . eat-eshell-visual-command-mode))

(provide 'init-eat)
