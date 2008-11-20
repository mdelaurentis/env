(setq clojure-jar
      "/home/mdelaurentis/src/clojure/target/clojure-lang-1.0-SNAPSHOT.jar")

(setq clojure-contrib-jar
      "/home/mdelaurentis/src/clojure-contrib/clojure-contrib.jar")

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

(setq inferior-lisp-program
      (concat "java -cp " 
              (make-classpath 
               (list clojure-jar clojure-contrib-jar))
              " clojure.lang.Repl"))

(add-path "/clojure-mode")
(require 'clojure-auto)
(require 'clojure-paredit)



