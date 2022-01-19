(import (chicken format)
        (chicken string)
        srfi-37
        )

(define (main args)
  (printf "~A\n" (join-together args)))

(define (join-together s)
  (define (inner-join s str)
    (if (eq? s '())
      str
      (inner-join (cdr s) 
                  (if (eq? (string-length str) 0)
                    (car s)
                    (format "~A ~A" str (car s))))))
  (inner-join s ""))
