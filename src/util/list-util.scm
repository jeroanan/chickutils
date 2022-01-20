(declare (unit list-util))

(define (take n lst)
    (define (loop lst res n)
        (if (or (<= n 0) (= (length lst) 0))
            res
            (loop (cdr lst) (flatten (list res (car lst))) (- n 1))))
    (loop lst (list) n))


