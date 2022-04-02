(declare (uses file-util
               cmdline-util))

(define version-string "2022.04.02.01")

(define flag-map (list))

(define (cat files)
  (define (main-loop as)
    (unless (= (length as) 0)
      (begin
        (print (file->string (car as)))
        (main-loop (cdr as)))))
  (main-loop files))

(define files (get-command-line-without-flags flag-map))

(maybe-print-version-and-quit version-string)
(cat files)

