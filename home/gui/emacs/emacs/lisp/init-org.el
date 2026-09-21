;; -*- lexical-binding: t; -*-

(use-package org
  :ensure t
  :config
  (setq org-hide-emphasis-markers t)
  (setq org-hidden-keywords '(title author date startup))
  (custom-theme-set-faces
 'user
 '(org-document-title ((t (:height 1.8  :weight extra-bold :foreground "#f0f4f8" :inherit fixed-pitch))))
 '(org-level-1        ((t (:height 1.35 :weight extra-bold :foreground "#d8e2ec" :inherit fixed-pitch))))
 '(org-level-2        ((t (:height 1.20 :weight extra-bold :foreground "#d8e2ec" :inherit fixed-pitch))))
 '(org-level-3        ((t (:height 1.10 :weight extra-bold :foreground "#d8e2ec" :inherit fixed-pitch))))
 '(org-level-4        ((t (:height 1.05 :weight extra-bold :foreground "#d8e2ec" :inherit fixed-pitch))))))

;; hook for changing prose colour to the heading one
(add-hook 'org-mode-hook
          (lambda ()
            (face-remap-add-relative 'default
				     :foreground "#d8e2ec")))

;; Set languages in org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

;; Org buffer clean-up settings
(use-package org
  :config
  ;; Hide keyword tags (#+TITLE, #+AUTHOR, etc.)
  (setq org-hidden-keywords '(title author date startup options))
  ;; Cleanly hide leading stars without overlay/ghost-cursor bugs
  (setq org-hide-leading-stars t)
  ;; Subtle line spacing for better reading flow
  (setq-default line-spacing 0.15))

;; Hide leading stars and change bullet points
(setq org-hide-leading-stars t)

;; NΛNO-style heading numbering
(use-package org-num
  :after org
  :hook (org-mode . org-num-mode)
  :config
  (setq org-num-skip-unnumbered t)
  (setq org-num-max-level 3)
  (setq org-num-format-function
      (lambda (numbering)
        (let ((num-str (mapconcat #'number-to-string numbering ".")))
          (if (= (length numbering) 1)
              ;; Level 1 Heading: Soft Slate Blue (#565f89)
              (propertize (concat num-str " │ ") 
                          'face '(:foreground "#565f89"))
            ;; Subheadings: Deep Slate (#4a506a)
            (propertize (concat num-str " — ") 
                        'face '(:foreground "#4a506a")))))))

;; (use-package org-superstar
;;   :ensure t
;;   :hook (org-mode . org-superstar-mode)
;;   :config
;;   (setq org-superstar-headline-bullets-list '(""))
;;   (setq org-superstar-leading-bullet ""))

(straight-use-package '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))
(require 'nano-writer)

;; automatically use it whenever in org
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . writer-mode))

;; Use it for any text mode like txt, md, org (unsure whether it really works)
;; (add-hook 'text-mode-hook #'nano-writer-mode)

(provide 'init-org)
