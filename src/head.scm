(import (chicken format)
        (chicken string))

(declare (uses file-util)
         (uses list-util)
         (uses cmdline-util))

(define flag-map (list
                       (list "-n" #t)))

(define has-n-flag? (command-line-has-flag? "-n"))

(define lines-to-print 
  (if has-n-flag? 
      (get-command-line-flag-value-number "-n")
      5))

;; if lines-to-print is negative, then it should print all
;; but the absolute number of lines.
(define take-or-drop (if (< lines-to-print 0) drop take))

(define files-to-print (get-command-line-without-flags flag-map))

(define print-file-headers? (> (length files-to-print) 1))

(define (head-file file-name)
  (let* ([lines (file->lines file-name)]
         [first-lines (take-or-drop (abs lines-to-print) lines)]
         [output (string-intersperse first-lines "\n")])
    (when print-file-headers? (printf "==> ~A <==\n" file-name))
    (print output)))

(define (head-files)
  (define (loop files) 
    (when (not (empty? files))
      (head-file (car files))
      (loop (cdr files))))
  (loop files-to-print))

(head-files)