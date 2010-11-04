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

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(defun  lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)
(add-to-list 'load-path "/Users/mdelaurentis/src/clojure-mode")
(require 'clojure-mode)
(add-to-list 'load-path "/Users/mdelaurentis/src/swank-clojure")
(require 'swank-clojure)
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Haskell Mode
;;;

;; (add-to-list 'load-path (mrd-file "haskel-mode-2.4"))
;; (load "haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; This fixes an issue where emacs tries to display doc for a symbol
;; in the minibuffer but complains about slime-symbol-name-at-point
;; not being defined.
;(defun slime-symbol-name-at-point ()
;  (slime-symbol-at-point))

;; (eval-after-load "slime"
;;   '(progn
;;     (slime-setup)))

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'load-path "~/src/env/emacs/groovy")
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(setq c-default-style
      '((groovy-mode . "java")))

(add-to-list 'auto-mode-alist '("\\.gsp$" . html-mode))

(tabbar-mode -1)



;; Processing

(add-to-list 'load-path "/Users/mdelaurentis/src/processing-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
;; processing-mode will append /java/bin/java to this, so I had to
;; symlink the java binary to a spot where it could be in a java/bin
;; directory.
(setq processing-location "/Users/mdelaurentis/local")
