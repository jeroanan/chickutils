(import (chicken process-context)
        (chicken string))

(declare (uses file-string))

(define (take n lst)
    (define (loop lst res n)
        (if (or (<= n 0) (= (length lst) 0))
            res
            (loop (cdr lst) (flatten (list res (car lst))) (- n 1))))
    (loop lst (list) n))

;; For now, this only prints the first five lines of a single file
(define (head)
    (let* ([file-name (car (command-line-arguments))]
           [file-contents (file->string file-name)]
           [lines-split (string-split file-contents "\n" #t)]
           [first-five (take 5 lines-split)]
           [output (string-intersperse first-five "\n")])
        (print output)))

(head)