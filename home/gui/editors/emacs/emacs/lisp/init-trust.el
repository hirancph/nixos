;; -*- lexical-binding: t; -*-
;; Trust-Manager to trust projects, files/folders and buffers.
(use-package trust-manager
  :ensure t
  :demand t
  :bind
  (("C-c T b" . trust-manager-trust-this-buffer)
   ("C-c T p" . trust-manager-set-project-trust)
   ("C-c T f" . trust-manager-set-file-trust)
   ("C-c T d" . trust-manager-dired))
  :custom
  (trust-manager-untrusted-indicator "?")
  (trust-manager-secure-additional-features '(file-local-variables))
  :config
  (trust-manager-mode 1))

(provide 'init-trust)
