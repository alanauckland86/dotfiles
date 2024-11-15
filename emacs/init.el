;; Welcome to Alan Auckland's emacs configuration

;; Quick usefull tips
;; ctl+h f = Get help about a current command
;; When using remote desktop from a mac to a Linux
;; XFCE desktop meta = esc+x 

;; EMACS USER INTERFACE

(setq inhibit-startup-message t)  ;; Disable start up message
(define-key key-translation-map (kbd "M-3") (kbd "#")) ;; Set ALT 3 as # on for mac os

(scroll-bar-mode -1)              ;; Disable visible scrollbar
(tool-bar-mode -1)                ;; Disable toolbar
(tooltip-mode -1)                 ;; Disable tooltips
(set-fringe-mode 10)              ;; Gives some breathing room

;;(menu-bar-mode -1)                ;; Disables the menu
(setq visible-bell t)             ;; Set visible bell (makse screen blink)



;; Set frame size on launch
(setq default-frame-alist
      '((top . 10) (left . 2)
        (width . 80) (height . 53)
 ;;       (font . "terminus-iso8859-1-bold-14")
        ))




;; Set line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;;(if (eq system-type 'gnu/linux)
;;  (set-face-attribute 'default nil :font "Fira Code Retina" :height 180)
;;)

;;(load-theme 'tango-dark)
;;(load-theme 'material t)

;; END EMACS USER INTERFACE
 


;; Emacs General configurations

;; Load path for manually installed packages
(make-directory "~/.emacs.d/work-config" t)
(add-to-list 'load-path "~/.emacs.d/work-config/")


;; Emacs backup files 
(make-directory "~/emacs-backup-files" t) ;; Make directory do not error if it already exists
(setq backup-directory-alist `(("." . "~/emacs-backup-files")))

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Tramp auto save directory
(setq tramp-auto-save-directory "~/tmp/tramp/")



;; Mac OS

;; On OS X/Darwin, make sure we add the path to the homebrew installs
(when (string-equal system-type "darwin")
  (setq exec-path (append exec-path '("/usr/local/bin"))))

;; Spelling on MacOS
;; https://stackoverflow.com/questions/19022015/emacs-on-mac-os-x-how-to-get-spell-check-to-work
;; brew install aspell
;; which aspell  
;; Download spelling libray en from https://ftp.gnu.org/gnu/aspell/dict/0index.html
;; which aspell
(when (string-equal system-type "darwin")
  (setq ispell-program-name "/usr/local/bin/aspell"))

(when (string-equal system-type "gnu/linux")
  (setq ispell-program-name "/usr/bin/aspell"))

  ;; Download spelling libray en from https://ftp.gnu.org/gnu/aspell/dict/0index.html
;; extract and install to ~/Libray/Spelling/aspelll......./
;; ALT + X  aspell-change-dictionary use ? to show all available 
;;(setq ispell--dictionary "en_GB")
;;(require 'ispell)
;; usilng flspell
;; (setq ispell-program-name "aspell")

;; Make sure on MacOS to run 'brew install markdown' to enable markdown preview

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; load all sub folders
;; https://www.emacswiki.org/emacs/CustomThemes  
(let ((basedir "~/.emacs.d/themes/"))
  (dolist (f (directory-files basedir))
    (if (and (not (or (equal f ".") (equal f "..")))
	     (file-directory-p (concat basedir f)))
	(add-to-list 'custom-theme-load-path (concat basedir f)))))


(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
 ;; https://github.com/qhga/shanty-theme:
(load-theme 'gruvbox-dark-hard t)
	     
;; (add-to-list 'load-path "/home/alan/dotfiles/emacs/themes/material-theme/emacs-material-theme-1.4")
;;(require 'material-theme)
;;(load-theme 'material t)i


;; Doom Modeline

;; ;; Install Nerd-icons required for Doom-modeline

;; IN WSL 
;; git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
;; cd nerd-fonts
;; ./install.sh

(unless (package-installed-p 'nerd-icons)
  (package-install 'nerd-icons))


(use-package nerd-icons
   :ensure t)

(set-face-attribute 'default nil :font "RobotoMono Nerd Font Mono" :height 180)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))



;; PROJECTILE
;; Install & Configure projectile https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

;; END OF PROJECTILE


;; org-mode
(unless (package-installed-p 'org-roam)
  (package-install 'org-roam))

(use-package org-roam)



;; Spell checking
  ;; Requires Hunspell
  (use-package flyspell
    :config
    (setq ispell-program-name "aspell"
          ispell-default-dictionary "en_GB")
    (when
    (setq ispell-program-name "hunspell"
          ispell-default-dictionary "en_GB"))
    (when (string-equal system-type "gnu/linux")
      (setq ispell-program-name "/usr/bin/aspell"))    
    :hook (text-mode . flyspell-mode)
    :bind (("M-<f7>" . flyspell-buffer)
           ("<f7>" . flyspell-word)
           ("C-;" . flyspell-auto-correct-previous-word)))





;; Show commands entered in new window
;; ctl+x ctl+e to evaluate new package
;; meta+x comman-log-mode to run
;; Open command log =  M-x clm/open-command-log-buffer
(use-package command-log-mode)



(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "/usr/local/bin/pandoc"))


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-expand-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-litter-directories            '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

;;     The default width and height of the icons is 22 pixels. If you are
;;    ;; using a Hi-DPI display, uncomment this to double the icon size.
      (treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))


(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))


(use-package magit
  :bind ("C-x g" . magit-status)
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Enable vim evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)


;; Install and use Helm for fuzzy finding
(unless (package-installed-p 'helm)
  (package-install 'helm))

(require 'helm)
(helm-mode 1)


;; Install and use ssh.el
(unless (package-installed-p 'ssh)
  (package-install 'ssh))


(use-package ssh
  :ensure t)
  ;;:after comint)

(require 'ssh)

;; Dirvish dired file manager replacment

(unless (package-installed-p 'dirvish)
  (package-install 'dirvish))

(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  )
(require 'dirvish)


;; END PACKAGE MANAGMENT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(linum+ evil command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)


(put 'downcase-region 'disabled nil)
