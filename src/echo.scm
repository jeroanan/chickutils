(import (chicken format)
        (chicken string)
        (chicken process-context)
        srfi-37)

(declare (uses cmdline-util))

(define flag-map (list 
                    (list "-n" #f)
                    (list "-e" #f)
                    (list "-E" #f)))
                    
(define has-n-flag? (command-line-has-flag? "-n"))
(define has-e-flag? (command-line-has-flag? "-e"))
(define has-E-flag? (command-line-has-flag? "-E"))

(define line-ending (if has-n-flag? "" "\n"))
(define interpret-escapes? 
  (cond ((and has-E-flag? (not has-e-flag?)) #f)
        (else #t)))

;; Missing escape chars:
;;   \c (stop output at this point)
;;   \e (escape)
;;   \0NNN (octal escape)
;;   \xHH (hex escape)
(define (replace-escapes string)
  (if (not interpret-escapes?)
    string
    (string-translate* 
      string 
      '(("\\\\" . "\\")
        ("\\a" . "\a")
        ("\\b" . "\b")
        ("\\f" . "\f")
        ("\\n" . "\n")
        ("\\r" . "\r")
        ("\\t" . "\t")
        ("\\v" . "\v")))))

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
(printf "~A~A" (replace-escapes (join-together echo-words)) line-ending)