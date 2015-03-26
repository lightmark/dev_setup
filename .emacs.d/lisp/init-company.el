(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)
;(add-to-list 'company-backends 'company-anaconda)
;(add-hook 'python-mode-hook 'anaconda-mode)

(provide 'init-company)
