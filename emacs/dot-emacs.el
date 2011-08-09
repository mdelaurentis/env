;; Setup load path.
;; I use clojure-mode and swank-clojure in my ~/src dir.
(add-to-list 'load-path "/Users/mdelaurentis/.emacs.d")
(add-to-list 'load-path "/Users/mdelaurentis/.emacs.d/slime")
(add-to-list 'load-path "/Users/mdelaurentis/.emacs.d/clojure-mode")
(add-to-list 'load-path "/Users/mdelaurentis/src/env/emacs/")
(add-to-list 'load-path "~/src/env/emacs/groovy")

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

(require 'clojure-mode)
(require 'paredit)

;; Turn on paredit mode for .clj and .el files.
(defun  lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)

(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(setq c-default-style
      '((groovy-mode . "java")
        (java-mode   . "java")))

(add-to-list 'auto-mode-alist '("\\.gsp$" . html-mode))


(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(require 'column-marker)

(add-hook 'java-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'groovy-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

(set-face-foreground 'minibuffer-prompt "white")