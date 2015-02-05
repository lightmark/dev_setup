;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
;;(require 'init-compat)
(require 'init-utils)
;;(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)
;;(require 'init-exec-path) ;; Set up $PATH

;; cursor blink off
(blink-cursor-mode -1)


(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; Tools
(require 'init-auto-complete)
(require 'yasnippet)

(yas-global-mode t)
(require 'init-python-mode)
(require 'init-themes)

;; Web mode
(require 'init-emmet-mode)
;;(require 'init-jinja2-mode)
(require 'init-tern)
;;-----------------------
(setq auto-save-default nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(somedoorcustom-safe-themes (quote ("146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default))))
