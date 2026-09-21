;; -*- lexical-binding: t; -*-

;; Keep buffer list clean
(setq dired-kill-when-opening-new-dired-buffer t)

(use-package nerd-icons
  :ensure t
  :config
  ;; fix for missing icons
  (unless (member "Symbols Nerd Font Mono" (font-family-list))
    (nerd-icons-install-fonts t)))

(use-package dirvish
  :ensure t
  :init
  (dirvish-override-dired-mode)
  :config
  ;; hasn't figured out how to do 3 column layout
  ;; (setq dirvish-layout-recipes
  ;;       '((0.2 0.3 0.5)   
  ;;         (0.0 0.5 0.5)
  ;;         (0.0 1.0 0.0)))

  ;; Icons and file metadata
  (setq dirvish-attributes
        '(nerd-icons file-time file-size collapse vc-state)))

;; Apply custom bindings directly on top of evil-collection
(with-eval-after-load 'evil-collection
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" #'dired-up-directory      ; Go to parent directory
    "l" #'dired-find-file         ; Enter directory / open file
    "j" #'dired-next-line         ; Move down
    "k" #'dired-previous-line     ; Move up
    ;; "F" #'dirvish-layout-toggle
    )) 

(provide 'init-dirvish)
