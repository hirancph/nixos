;; -*- lexical-binding: t; -*-

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; global-auto-revert-mode reloads file-visiting buffers
(global-auto-revert-mode 1)

;; Automatically refresh Dired and other non-file buffers when files change on disk
(setq global-auto-revert-non-file-buffers t)

;; Silence "Reverting buffer..." messages in the echo area
(setq auto-revert-verbose nil)
