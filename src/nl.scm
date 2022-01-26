(import (chicken process-context)
        (chicken format)
        (srfi-152))

(declare (uses file-util)
         (uses list-util))


(define (get-lines fs ls)
    (if (= (length fs) 0)
        ls
        (get-lines (rest fs) (append ls (file->lines (first fs))))))

(define (print-line l n)
  (let* ([is-empty-line? (string=? (string-trim l) "")]
         [line-number (if is-empty-line? n (+ n 1))]
         [line-number-string (if is-empty-line? "" (number->string line-number))]
         [padding (if is-empty-line? "" (make-string (- 6 (string-length line-number-string))))])

    (printf "~A~A ~A\n" padding line-number-string l)
    line-number))

(define (number-lines ls)
    (define (loop ls n)
        (when (> (length ls) 0)
          (let* ([this-line (first ls)]
                 [trimmed (string-trim this-line)]
                 [line-number (number->string n)])
            (if (string=? trimmed "")
                (begin 
                  (print this-line)
                  (loop (rest ls) n))
                (begin
                  (printf "~A~A ~A\n" (make-string (- 6 (string-length line-number))) line-number this-line)
                  (loop (rest ls) (+ n 1)))))))
    (loop ls 1))
            

(define file-lines (get-lines (command-line-arguments) (list)))

(number-lines file-lines)
