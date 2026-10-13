;; -*- lexical-binding: t; -*-

;; Keep buffer list clean
(setq dired-kill-when-opening-new-dired-buffer t)

(use-package nerd-icons
  :ensure t
  :config
  (when (display-graphic-p)
    (unless (member "Symbols Nerd Font Mono" (font-family-list))
      (nerd-icons-install-fonts t))))

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

;; function to export org
(defun my/ox-hugo-dired-export ()
  "Export marked Org files or the file under point in Dired to Hugo using ox-hugo."
  (interactive)
  (require 'ox-hugo)
  (let ((files (dired-get-marked-files)))
    (dolist (file files)
      (when (string-match-p "\\.org$" file)
        (with-current-buffer (find-file-noselect file)
          (org-mode)
          (hack-local-variables) ; Force loading dir-locals for the buffer
          (org-hugo-export-to-md)
          (message "Exported %s to Hugo!" (file-name-nondirectory file)))))))

;; Apply custom bindings directly on top of evil-collection
(with-eval-after-load 'evil-collection
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" #'dired-up-directory      ; Go to parent directory
    "l" #'dired-find-file         ; Enter directory / open file
    "j" #'dired-next-line         ; Move down
    "k" #'dired-previous-line     ; Move up
    "E" #'my/ox-hugo-dired-export ; export fast
    ;; "F" #'dirvish-layout-toggle
    )) 

(provide 'init-dirvish)
