(setq clojure-jar
      (concat (getenv "HOME") "/src/clojure/clojure.jar"))

(setq clojure-contrib-jar
      (concat (getenv "HOME") "/src/clojure-contrib/clojure-contrib.jar"))

(setq sleepycat-jar
      (concat (getenv "HOME") "/src/je-3.3.75/lib/je-3.3.75.jar"))

(setq system-is-cygwin (eq 'windows-nt system-type))

(defun maybe-cygpath (path)
  (if system-is-cygwin
      (let ((new-path (shell-command-to-string (concat "cygpath -w " path))))
        (substring new-path 0 (- (length new-path) 1)))
    path))

(defun make-classpath (items)
  (mapconcat #'maybe-cygpath
             items
             (if system-is-cygwin ";" ":")))

;(setq inferior-lisp-program
;      (concat "java -cp " 
;              (make-classpath 
;               (list clojure-jar clojure-contrib-jar sleepycat-jar))
;              " clojure.lang.Repl"))

(setq inferior-lisp-program (concat (getenv "HOME") "/src/mdmutils/target/installed/bin/repl"))

(setq inferior-lisp-program (concat (getenv "HOME") "/src/bingo/repl"))

(add-path "/clojure-mode")
(require 'clojure-auto)
(require 'clojure-paredit)
