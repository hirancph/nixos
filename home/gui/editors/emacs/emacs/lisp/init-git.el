;; -*- lexical-binding: t; -*-

;; Modern Magit Setup (Emacs 29+)
(use-package magit
  :ensure t
  :bind (("C-x g"   . magit-status)
         ("C-c g b" . magit-blame)
         ("C-c g l" . magit-log-buffer-file))
  :custom
  ;; Reuse current window for magit-status instead of splitting windows
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  ;; Automatically save modified project buffers before staging/committing
  (magit-save-repository-buffers 'autosafe)
  ;; Turn off heavy hunk-refinement highlighting by default for better performance
  (magit-diff-refine-hunk nil)
  :config
  ;; Show commit author and timestamp in log buffers by default
  (setq magit-log-margin '(t "%Y-%m-%d %H:%M" magit-log-margin-width t 18)))

;; Live Git Diff Indicators in Fringe (Integrates with Magit)
(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode) ;; Real-time updates before saving file
  :config
  ;; Automatically refresh fringe status when staging/committing in Magit
  (add-hook 'magit-pre-refresh-hook #'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh))

;; Modern Addition: Project TODOs directly inside Magit Status
(use-package magit-todos
  :ensure t
  :after magit
  :config
  (magit-todos-mode 1))

(provide 'init-git)
