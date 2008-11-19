;; -*- emacs-lisp -*-

(setq inferior-lisp-program "java -cp /cygwin/usr/local/lib/clojure.jar; clojure.lang.Repl" )
;(setq repo "c:/Users/Mike/.m2/repository/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set up clojure-mode
;;
;;
;;(setq   inferior-lisp-program
;;                                          ; Path to java implementation
;;        (let* ((java-path "java")
;;                                          ; Extra command-line options
;;                                          ; to java.
;;               (java-options "")
;;                                          ; Base directory to Clojure.
;;                                          ; Change this accordingly.
;;               (clojure-path "~/src/clojure/trunk/")
;; 					; The character between
;; 					; elements of your classpath.
;;               (class-path-delimiter ";")
;;               (class-path 
;;                (mapconcat 
;;                 (lambda (s) s)
;; 					; Add other paths to this list
;; 					; if you want to have other
;; 					; things in your classpath.
;;                 (list  
;;                  "~/src/clojure/clojure.jar"
;;  ;                (concat repo  "commons-httpclient/commons-httpclient/3.1/commons-httpclient-3.1.jar" )
;; ;                 (concat repo  "commons-codec/commons-codec/1.2/commons-codec-1.2.jar")
;; ;                 (concat repo  "junit/junit/3.8.1/junit-3.8.1.jar")
;; ;                 (concat repo "commons-logging/commons-logging/1.0.4/commons-logging-1.0.4.jar")
;;                  )
;;                 class-path-delimiter)))
;; 	 (concat java-path
;;                  " " java-options
;;                  " -cp " class-path
;;                  " clojure.lang.Repl")))

(add-to-list 'load-path (concat env-root "emacs.d/clojure-mode"))
(add-to-list 'load-path (concat env-root "emacs.d/ruby-mode"))
(add-to-list 'load-path (concat env-root "emacs.d/rinari"))
(add-to-list 'load-path (concat env-root "emacs.d/rinari-rhtml"))
(require 'clojure-auto)
(require 'clojure-paredit)



;(require 'ruby-mode)
;(require 'rinari)
;(require 'rhtml-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set up ruby-mode
;;

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



;;(defun  my-jde-mode-hook ()
;;   (c-add-style
;;    "my-java"
;;    '("java"
;;      (c-basic-offset . 2)))
;;   (c-set-style "my-java"))

;; (add-hook 'jde-mode-hook 'my-jde-mode-hook)

(setq-default indent-tabs-mode nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;
;; ;;; Cedet Stuff
;; ;;;

;; ;; Load CEDET
;; (add-to-list 'load-path (expand-file-name "~/emacs/site/cedet/common"))
;; (load-file "~/emacs/site/cedet/common/cedet.el")

;; ;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; ;; Select one of the following:

;; ;; * This enables the database and idle reparse engines
;; ;;(semantic-load-enable-minimum-features)

;; ;; * This enables some tools useful for coding, such as summary mode
;; ;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; ;; * This enables even more coding tools such as the nascent intellisense mode
;; ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; ;; (semantic-load-enable-guady-code-helpers)

;; ;; * This turns on which-func support (Plus all other code helpers)
;; ;; (semantic-load-enable-excessive-code-helpers)

;; ;; This turns on modes that aid in grammar writing and semantic tool
;; ;; development.  It does not enable any other features such as code
;; ;; helpers above.
;; ;; (semantic-load-enable-semantic-debugging-helpers)


;(add-to-list 'load-path (expand-file-name "~/emacs/site/jde/lisp"))

;(add-to-list 'load-path (expand-file-name "~/emacs/site/elib"))

;; (require 'jde)


(defun load-from-env (path)
  (load (concat env-root path)))

(load-from-env "emacs.d/haskell-mode-2.4/haskell-site-file")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

