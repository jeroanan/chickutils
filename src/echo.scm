(import (chicken format)
        (chicken string)
        (chicken process-context)
        srfi-37)

(declare (uses cmdline-util))

(define flag-map (list 
                    (list "-n" #f)))
                    
(define has-n-flag? (command-line-has-flag? "-n"))

(define line-ending (if has-n-flag? "" "\n"))

(define (join-together s)
  (define (inner-join s str)
    (if (eq? s '())
      str
      (inner-join (cdr s) 
                  (if (eq? (string-length str) 0)
                    (car s)
                    (format "~A ~A" str (car s))))))
  (inner-join s ""))

(define echo-words (get-command-line-without-flags flag-map))
(printf "~A~A" (join-together echo-words) line-ending)