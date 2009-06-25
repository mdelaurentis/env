

(setq emacs-root (concat (getenv "HOME") "/src/env/emacs"))

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

(defun add-path (p)
      (add-to-list 'load-path (concat emacs-root p)))

(add-path "")

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)


(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)

(add-to-list 'load-path (concat (getenv "HOME") "/src/clojure-mode"))
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(setq swank-clojure-extra-classpaths)
(clojure-slime-config)

(eval-after-load "slime"
  '(progn
     (slime-setup '(slime-repl))))

(setq slime-lisp-implementations
      '((datastore
         ("/home/mdelaurentis/src/datastore/clj/target/installed/bin/repl")
         :init swank-clojure-init)
        (rankyanker
         ("/home/mdelaurentis/src/rankyanker/adhoc/target/installed/bin/repl")
         :init swank-clojure-init)))


;; (setq slime-lisp-implementations
;;       (append
;;        '((datastore ("/home/mdelaurentis/src/datastore/clj/target/installed/bin/repl") :init swank-clojure-init))
;;        '((rankyanker ("/home/mdelaurentis/src/rankyanker/adhoc/target/installed/bin/repl") :init swank-clojure-init))) :init swank-clojure-init))
       
;;        slime-lisp-implementations))

;;;
;;; Confluence Mode
;;;

;; assuming confluence.el and xml-rpc.el are in your load path
(add-to-list 'load-path (concat (getenv "HOME") "/src/confluence-el"))
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

(add-path "/haskell-mode-2.4/")
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set up ruby-mode
;;
;(add-to-list 'load-path (concat env-root "emacs.d/ruby-mode"))
;(add-to-list 'load-path (concat env-root "emacs.d/rinari"))
;(add-to-list 'load-path (concat env-root "emacs.d/rinari-rhtml"))

;(require 'ruby-mode)
;(require 'rinari)
;(require 'rhtml-mode)

;(autoload 'ruby-mode "ruby-mode"
;  "Mode for editing ruby source files" t)
;(setq auto-mode-alist
;      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
;(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
;    				     interpreter-mode-alist))
    

;(autoload 'run-ruby "inf-ruby"
;  "Run an inferior Ruby process")
;(autoload 'inf-ruby-keys "inf-ruby"
;  "Set local key defs for inf-ruby in ruby-mode")
;(add-hook 'ruby-mode-hook
;          '(lambda ()
;             (inf-ruby-keys)
;	     ))

