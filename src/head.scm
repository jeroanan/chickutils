(import (chicken format)
        (chicken string))

(declare (uses file-util)
         (uses list-util)
         (uses cmdline-util))

(define flag-map (list
                       (list "-n" #t)
                       (list "-c" #t)))

(define has-n-flag? (command-line-has-flag? "-n"))
(define has-c-flag? (command-line-has-flag? "-c"))

(define lines-to-print 
  (if has-n-flag? 
      (get-command-line-flag-value-number "-n")
      5))

(define bytes-to-print
  (if has-c-flag?
      (get-command-line-flag-value-number "-c")
      0))

;; if lines-to-print is negative, then it should print all
;; but the absolute number of lines.
(define take-or-drop (cond 
                        (has-c-flag? (if (< bytes-to-print 0) drop take))
                        (else (if (< lines-to-print 0) drop take))))

(define files-to-print (get-command-line-without-flags flag-map))

(define print-file-headers? (> (length files-to-print) 1))

(define (head-by-lines file-name)
  (let* ([lines (file->lines file-name)]
         [first-lines (take-or-drop (abs lines-to-print) lines)]
         [output (string-intersperse first-lines "\n")])
  (sprintf "~A\n" output)))

(define (head-by-bytes file-name)
  (let* ([file-str (file->string file-name)]
         [first-bytes (list->string (take-or-drop (abs bytes-to-print) (string->list file-str)))]
         [output first-bytes])
  output))

(define output-function (if has-c-flag? head-by-bytes head-by-lines))

(define (head-file file-name)
    (when print-file-headers? (printf "==> ~A <==\n" file-name))
    (printf (output-function file-name)))

(define (head-files)
  (define (loop files) 
    (when (not (empty? files))
      (head-file (car files))
      (loop (cdr files))))
  (loop files-to-print))

(head-files)