(setq clojure-jar-path
      (list "/cygwin/usr/local/lib/clojure.jar"
            "/home/mdelaurentis/src/clojure/target/clojure-lang-1.0-SNAPSHOT.jar"))

(setq clojure-contrib-jar-path
      (list "/cygwin/usr/local/lib/clojure-contrib.jar"
            "/home/mdelaurentis/src/clojure-contrib/clojure-contrib.jar"))

(setq classpath-delimiter (if (eq 'windows-nt system-type)
                              ";"
                            ":"))

(defun join-classpath (items)
  (mapconcat (lambda (s) s)
             items
             classpath-delimiter))

(setq inferior-lisp-program
      (concat "java -cp " 
              (join-classpath 
               (append clojure-jar-path 
                       clojure-contrib-jar-path))
              " clojure.lang.Repl"))

(add-to-list 'load-path (concat env-root "emacs.d/clojure-mode"))
(require 'clojure-auto)
(require 'clojure-paredit)