;; -*- lexical-binding: t; -*-

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p user-emacs-directory)
            "~/.emacs.d/")))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-archives '(("gnu"    . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa"  . "https://melpa.org/packages/")))

;; Add lisp directory to load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load custom modules
(require 'init-clean)
(require 'init-evil)
(require 'init-ui)
(require 'init-dirvish)
(require 'init-completion)
(require 'init-org)
(require 'init-languages)
(require 'init-git)
(require 'init-eat)
