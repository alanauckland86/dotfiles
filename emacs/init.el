;; EMACS USER INTERFACE

(setq inhibit-startup-message t)  ;; Disable start up message

(scroll-bar-mode -1)              ;; Disable visible scrollbar
(tool-bar-mode -1)                ;; Disable toolbar
(tooltip-mode -1)                 ;; Disable tooltips
(set-fringe-mode 10)              ;; Gives some breathing room

(menu-bar-mode -1)                ;; Disables the menu
(setq visible-bell t)             ;; Set visible bell (makse screen blink)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 180)
(load-theme 'tango-dark) 

;; END EMACS USER INTERFACE
 

;; START PACKAGE MANAGMENT

(require 'package) ;; Ensure we have the package "package" loaded to setup and manage packages in Emacs


;; Set up sources to get packages from. "package-archives" is a variable that holds the package source locations
;; which is why we are setting this.

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; prepare package system to be used
(package-initialize)

;;  check package-archive-contents is present
;; on first load look to see if there is an archive. If there is then get it
(unless package-archive-contents
  (package-refresh-contents))


;; install use-package if not installed on system
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; END PACKAGE MANAGMENT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
