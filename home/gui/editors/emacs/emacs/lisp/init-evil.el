;; -*- lexical-binding: t; -*-

(setq undo-limit 67108864)         ; 64 MB
(setq undo-strong-limit 100663296)  ; 96 MB
(setq undo-outer-limit 1006632960) ; 1 GB

;; Indentation defaults: always use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Smart backspace: delete back to previous tab stop (4 spaces) in indentation
(defun my/backward-delete-whitespace-or-char ()
  "Delete indentation back to the previous tab stop, or delete a single char."
  (interactive)
  (if (and (looking-back "^[ \t]+" (line-beginning-position))
           (not (bolp)))
      (let* ((col (current-column))
             (indent-size (or (bound-and-true-p evil-shift-width) 4))
             (rem (% col indent-size))
             (count (if (zerop rem) indent-size rem)))
        (backward-delete-char-untabify count))
    (if (and (bound-and-true-p evil-mode)
             (fboundp 'evil-delete-backward-char-and-join))
        (evil-delete-backward-char-and-join 1)
      (delete-char -1))))

(global-set-key (kbd "DEL") #'my/backward-delete-whitespace-or-char)
(global-set-key (kbd "<backspace>") #'my/backward-delete-whitespace-or-char)

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-fine-undo t)
  (setq evil-want-keybinding nil) ; Required by evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-shift-width 4)
  (setq evil-normal-state-cursor 'box
        evil-insert-state-cursor 'bar
        evil-visual-state-cursor 'hollow)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "DEL") #'my/backward-delete-whitespace-or-char)
  (define-key evil-insert-state-map (kbd "<backspace>") #'my/backward-delete-whitespace-or-char))

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
