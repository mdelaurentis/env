;; Setup load path.
;; I use clojure-mode and swank-clojure in my ~/src dir.
(add-to-list 'load-path "/Users/mike/.emacs.d")
;(add-to-list 'load-path "/Users/mike/.emacs.d/slime")
(add-to-list 'load-path "/Users/mike/.emacs.d/clojure-mode")
(add-to-list 'load-path "/Users/mike/.emacs.d/markdown-mode")
(add-to-list 'load-path "/Users/mike/.emacs.d/ruby-mode")
;(add-to-list 'load-path "/Users/mdelaurentis/src/env/emacs/")
;(add-to-list 'load-path "~/src/env/emacs/groovy")

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

(require 'clojure-mode)
(require 'paredit)

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


;; Turn on paredit mode for .clj and .el files.
(defun  lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)

(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

(setq c-default-style
      '((groovy-mode . "java")
        (java-mode   . "java")))

;(require 'column-marker)

(add-hook 'java-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'groovy-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

;(set-face-foreground 'minibuffer-prompt "white")

;; Column marker
(require 'column-marker)
(add-hook 'cperl-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Use cperl-mode instead of the default perl-mode
(defalias 'perl-mode 'cperl-mode)

;; just spaces
(setq-default indent-tabs-mode nil)

;; Use 4 space indents via cperl mode
(custom-set-variables
  '(cperl-close-paren-offset -4)
  '(cperl-continued-statement-offset 4)
  '(cperl-indent-level 4)
  '(cperl-indent-parens-as-block t)
  '(cperl-tab-always-indent t)
)