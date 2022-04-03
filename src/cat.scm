(import (chicken format))

(declare (uses file-util
               cmdline-util))

(define version-string "2022.04.03.01")

(define flag-map (list
                    (list "-b" #f)
                    (list "-n" #f)
                    (list "-u" #f)))

(define has-b-flag? (command-line-has-flag? "-b"))
(define has-n-flag? (command-line-has-flag? "-n"))

(define doing-numbering? (or has-b-flag? has-n-flag?))

(define (should-number-this-line? line)
  (and doing-numbering? (not (and (string=? line "") has-b-flag?))))

(define (format-with-line-number line line-number)
  (let* ([line-number-length (string-length (number->string line-number))]
          [spaces (make-string (- 6 line-number-length) #\space)])
    (sprintf "~A~A  ~A" spaces line-number line)))

(define (cat-file file-name)
  (let ([lines (file->lines file-name)]
        [line-number 1])
    (define (loop ls)
      (unless (empty? ls) 
        (let ([line (first ls)])
          (if (should-number-this-line? line)
            (begin
              (print (format-with-line-number line line-number))
              (set! line-number (+ line-number 1)))
            (print line))
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
