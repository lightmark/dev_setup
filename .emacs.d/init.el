;;; this file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "your emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;(require 'init-benchmarking) ;; measure startup time

(defconst *spell-check-support-enabled* nil) ;; enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; bootstrap config
;;----------------------------------------------------------------------------
;;(require 'init-compat)
(require 'init-utils)
;;(require 'init-site-lisp) ;; must come before elpa, as it may provide package.el
(require 'init-elpa)
;;(require 'init-exec-path) ;; set up $path

;; cursor blink off
(blink-cursor-mode -1)


(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
;;----------------------------------------------------------------------------
;; load configs for specific features and modes
;;----------------------------------------------------------------------------

;; tools

;;-------------customize-------
					;(require 'init-auto-complete)
(require 'init-company)
(require 'init-js2-mode)
(require 'init-helm)
(require 'init-web-mode)
;;-----------------------------

(require 'yasnippet)


(yas-global-mode t)
;;(setq linum-format "%4d \u2502 ")
(global-linum-mode t)

(require 'init-python-mode)
(require 'init-themes)

;; web mode
(require 'init-emmet-mode)
;;(require 'init-jinja2-mode)
(require 'init-tern)

;;; sass and scss
(require-package 'scss-mode)
(setq scss-compile-at-save nil)
;;-----------------------
(setq auto-save-default nil)

(custom-set-faces
 ;; custom-set-faces was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 '(custom-safe-themes (quote ("146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(somedoorcustom-safe-themes (quote ("146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default))))
