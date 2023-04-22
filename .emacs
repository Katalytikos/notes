(require 'package)
(require 'helm)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; GENERAL

(set-frame-font "DejaVu Sans Mono 16" nil t)
(load-theme 'solarized-dark t)

(add-hook 'text-mode-hook 'visual-line-mode)

(setq-default left-margin-width 2 right-margin-width 2)
(set-window-buffer nil (current-buffer))

;; SPELLING AND HELPERS

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; BIBTEX
(setq bibtex-completion-bibliography
      '("~/org-roam//bibliography.bib"))
(setq bibtex-completion-notes-path "~/org-roam/bib-notes")

;; ORG

;; ORG-ROAM

(org-roam-db-autosync-mode)

(use-package org-roam
    :after org
    :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
    :custom
    (org-roam-directory (file-truename "~/org-roam"))
    :config
    (org-roam-setup)
    :bind (("C-c n f" . org-roam-node-find)
           ("C-c n r" . org-roam-node-random)		    
           (:map org-mode-map
                 (("C-c n i" . org-roam-node-insert)
                  ("C-c n o" . org-id-get-create)
                  ("C-c n t" . org-roam-tag-add)
                  ("C-c n a" . org-roam-alias-add)
                  ("C-c n l" . org-roam-buffer-toggle)))))

;; WRITEROOM


;; CUSTOM-AUTO

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-roam-ui org-roam-bibtex org-ref helm-bibtexkey writeroom-mode use-package solarized-theme pdf-tools org-roam org-re-reveal key-chord ivy-bibtex hydra helm-bibtex bibtex-completion))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
