(import (chicken format))

(declare (uses file-util
               cmdline-util))

(define version-string "2022.04.02.02")

(define flag-map (list
                    (list "-n" #f)))

(define has-n-flag? (command-line-has-flag? "-n"))

(define (format-with-line-number line line-number)
  (if has-n-flag?
      (let* ([line-number-length (string-length (number->string line-number))]
             [spaces (make-string (- 6 line-number-length) #\space)])
        (sprintf "~A~A ~A" spaces line-number line))
      line))

(define (cat-file file-name)
  (let ([lines (file->lines file-name)]
        [line-number 1])
    (define (loop ls)
      (unless (empty? ls)
        (begin
          (print (format-with-line-number (first ls) line-number))
          (set! line-number (+ line-number 1))
          (loop (rest ls)))))
    (loop lines)))
  
(define (cat-files files)
  (define (main-loop as)
    (unless (= (length as) 0)
      (begin
        (cat-file (car as))
        (main-loop (cdr as)))))
  (main-loop files))

(define files (get-command-line-without-flags flag-map))

(maybe-print-version-and-quit version-string)
(cat-files files)

