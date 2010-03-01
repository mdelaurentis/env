;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

;; Use GNU-style indentation for Java
; (setq c-default-style (cons (cons 'java-mode "gnu") c-default-style ))

(defvar *mrdemacs-home*
  (expand-file-name "~/src/env/emacs")
  "The install location of my emacs configuration.  All other
  modules will be relative to this location.")

(defun mrd-file (file)
  "Helper for locating files relative to the installation root."
  (concat *mrdemacs-home* "/" file))


(defun  lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)

;;;
;;; Confluence Mode
;;;

(add-to-list 'load-path "~/src/confluence-el")
(require 'confluence)

;; note, all customization must be in *one* custom-set-variables block
(custom-set-variables
 ;; ... other custimization

 ;; confluence customization
 '(confluence-url "http://intranet.hmsonline.com/confluence/rpc/xmlrpc")
 '(confluence-default-space-alist (list (cons confluence-url "SWDEV"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Haskell Mode
;;;

(add-to-list 'load-path (mrd-file "haskel-mode-2.4"))
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; This fixes an issue where emacs tries to display doc for a symbol
;; in the minibuffer but complains about slime-symbol-name-at-point
;; not being defined.
(defun slime-symbol-name-at-point ()
  (slime-symbol-at-point))