(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'prog-mode-hook 'subword-mode)

(setq
  default-directory "~/"
  gc-cons-threshold 20000000
  vc-follow-symlinks t
  require-final-newline t
  inhibit-startup-message t
  initial-scratch-message nil
  show-paren-delay 0.0)

(setq-default
  dired-listing-switches "-alh"
  fill-column 80)

(fset 'yes-or-no-p 'y-or-n-p)

(transient-mark-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode)

(use-package evil
             :config
             (evil-mode 1))

(use-package evil-surround
             :config
             (global-evil-surround-mode 1))

(use-package zerodark-theme
             :config
             (load-theme 'zerodark t))
