;; Setup load path.
(add-to-list 'load-path "/Users/mdelaurentis/.emacs.d")
(add-to-list 'load-path "/Users/mdelaurentis/src/clojure-mode")
(add-to-list 'load-path "/Users/mdelaurentis/src/env/emacs/")
(add-to-list 'load-path "/Users/mdelaurentis/src/swank-clojure")
(add-to-list 'load-path "~/src/env/emacs/groovy")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; I use clojure-mode and swank-clojure in my ~/src dir.

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

;; Turn on paredit mode for .clj and .el files.
(defun  lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)

(add-to-list 'auto-mode-alist '("\.gsp$" . nxml-mode))

(require 'clojure-mode)

(require 'swank-clojure)
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(setq c-default-style
      '((groovy-mode . "java")))

(add-to-list 'auto-mode-alist '("\\.gsp$" . html-mode))

;; Processing

;(add-to-list 'load-path "/Users/mdelaurentis/src/processing-emacs/")
;(autoload 'processing-mode "processing-mode" "Processing mode" t)
;(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
;; processing-mode will append /java/bin/java to this, so I had to
;; symlink the java binary to a spot where it could be in a java/bin
;; directory.
;(setq processing-location "/Users/mdelaurentis/local")

;(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
;(require 'coffee-mode)



