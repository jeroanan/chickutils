(import (chicken format))

(declare (uses file-util
               cmdline-util))

(define version-string "2022.04.03.02")

(define flag-map (list
                    (list "-b" #f)
                    (list "-n" #f)
                    (list "-s" #f)
                    (list "-u" #f)))

(define has-b-flag? (command-line-has-flag? "-b"))
(define has-n-flag? (command-line-has-flag? "-n"))
(define has-s-flag? (command-line-has-flag? "-s"))

(define doing-numbering? (or has-b-flag? has-n-flag?))

(define (suppress-line? line-text last-line-blank?)
  (let ([line-empty? (string=? line-text "")])
    (and line-empty? last-line-blank? has-s-flag?)))

(define (should-number-this-line? line last-line-blank?)
  (and doing-numbering? 
       (not (and (string=? line "") has-b-flag?))
       (not (suppress-line? line last-line-blank?))))

(define (format-with-line-number line line-number last-line-blank?)
  (if (should-number-this-line? line last-line-blank?)
    (let* ([line-number-length (string-length (number->string line-number))]
          [spaces (make-string (- 6 line-number-length) #\space)])
      (sprintf "~A~A  ~A" spaces line-number line))
    line))

(define (print-line line-text line-number last-line-blank?)
  (unless (suppress-line? line-text last-line-blank?)
    (print (format-with-line-number line-text line-number last-line-blank?))))

(define (cat-file file-name)
  (let ([lines (file->lines file-name)]
        [line-number 1]
        [last-line-blank? #f])
    (define (loop ls)
      (unless (empty? ls) 
        (let ([line (first ls)])
          (print-line line line-number last-line-blank?)
          (when (should-number-this-line? line last-line-blank?)
              (set! line-number (+ line-number 1)))
          (set! last-line-blank? (string=? line ""))
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
