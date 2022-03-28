(declare (unit list-util))

(define first car)
(define (second list) (take 1 (cdr list)))

(define (last l)
  (first (reverse l)))

(define rest cdr)

(define (take n lst)
    (define (loop lst res n)
        (if (or (<= n 0) (= (length lst) 0))
            res
            (loop (cdr lst) (flatten (list res (car lst))) (- n 1))))
    (loop lst (list) n))

(define drop (lambda (n lst)
    (if (= n 0)
        lst
        (drop (- n 1) (cdr lst)))))

(define (empty? lst) (= (length lst) 0))

(define (any? pred lst)
    (define (loop lst)
        (if (null? lst)
            #f
            (or (pred (car lst)) (loop (cdr lst)))))
    (loop lst))
