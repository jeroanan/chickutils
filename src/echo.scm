(import (chicken format)
        (chicken string)
        (chicken process-context)
        srfi-37)


(define (join-together s)
  (define (inner-join s str)
    (if (eq? s '())
      str
      (inner-join (cdr s) 
                  (if (eq? (string-length str) 0)
                    (car s)
                    (format "~A ~A" str (car s))))))
  (inner-join s ""))

(printf "~A\n" (join-together (command-line-arguments)))