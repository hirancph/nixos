;; -*- lexical-binding: t; -*-
(use-package org-roam
  :ensure t
  :init
  (define-prefix-command 'org-roam-prefix-map)

  :custom
  (org-roam-directory (expand-file-name "~/Documents/org/"))
  (org-roam-completion-everywhere t)

  :bind (:prefix-map org-roam-prefix-map
		     :prefix "C-c n"
		     ("l" . org-roam-buffer-toggle)
		     ("f" . org-roam-node-find)
		     ("g" . org-roam-graph)
		     ("i" . org-roam-node-insert)
		     ("r" . org-roam-refile)
		     ("c" . org-roam-capture))

  :config
  (org-roam-db-autosync-mode))

;; Remove the filename bloat
(setq org-roam-capture-templates
      '(("d" "default" plain
	 "%?"
	 :if-new (file+head "${slug}.org"
			    "#+title: ${title}\n#+date: %T\n#+filetags: \n")
	 :unnarrowed t)))

(provide 'init-org-roam)
