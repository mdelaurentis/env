(setq emacs-root (concat (getenv "HOME") "/src/env/emacs"))

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

(defun add-path (p)
      (add-to-list 'load-path (concat emacs-root p)))

(add-path "")

(load "clojure-stuff")

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

