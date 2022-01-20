(import (chicken process-context))

(declare (uses file-util))

(define (cat)
  (define (main-loop as)
    (unless (= (length as) 0)
      (begin
        (print (file->string (car as)))
        (main-loop (cdr as)))))
  (main-loop (command-line-arguments)))

(cat)

