(setq emacs-root (concat (getenv "HOME") "/src/env/emacs"))

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

(defvar *mrdemacs-home*
  (expand-file-name "~/src/env/emacs")
  "The install location of my emacs configuration.  All other
  modules will be relative to this location.")

(defvar *mrd-lib-dirs* 
  '(""
    "git"
    "haskell-mode-2.4")
  "List of my customization module directories.")

(defun mrd-file (file)
  "Helper for locating files relative to the installation root."
  (concat *mrdemacs-home* "/" file))

(mapcar #'(lambda (path)
            (add-to-list 'load-path (mrd-file path)))
        *mrd-lib-dirs*)
(add-to-list 'load-path "~/src/clojure-mode")
(add-to-list 'load-path "~/src/confluence-el")

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)


(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)


(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))



(setq swank-clojure-extra-classpaths)
(clojure-slime-config)

(eval-after-load "slime"
  '(progn
     (slime-setup '(slime-repl))))

(setq slime-lisp-implementations
      '((hw1
         ("/Users/mdelaurentis/Classes/cs500/hw1/repl")
         :init swank-clojure-init)
        (datastore
         ("/home/mdelaurentis/src/datastore/clj/target/installed/bin/repl")
         :init swank-clojure-init)
        (rankyanker
         ("/home/mdelaurentis/src/rankyanker/adhoc/target/installed/bin/repl")
         :init swank-clojure-init)
        (fermentagious
         ("/Users/mdelaurentis/src/brewlog/repl")
         :init swank-clojure-init)
        (contest
         ("/Users/mdelaurentis/src/engine-yard-contest/repl")
         :init swank-clojure-init)
        (mdelaurentis-dot-com
         ("cd /Users/mdelaurentis/src/mdelaurentis; ./repl")
         :init swank-clojure-init)
        (anytable
         ("/Users/mdelaurentis/src/anytable/bin/repl")
         :init swank-clojure-init)
        (hw8
         ("/Users/mdelaurentis/Classes/cs500/homework8/bin/repl")
         :init swank-clojure-init)))
;;;
;;; Confluence Mode
;;;

;; assuming confluence.el and xml-rpc.el are in your load path
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


(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


(require 'git)
