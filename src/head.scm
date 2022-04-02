(import (chicken format)
        (chicken string))

(declare (uses file-util)
         (uses list-util)
         (uses cmdline-util))

(define version-string "2022.04.02.01")

(define flag-map (list
                       (list "-n" #t)
                       (list "-c" #t)
                       (list "-q" #f)
                       (list "-v" #f)))

(define has-n-flag? (command-line-has-flag? "-n"))
(define has-c-flag? (command-line-has-flag? "-c"))
(define has-q-flag? (command-line-has-flag? "-q"))
(define has-v-flag? (command-line-has-flag? "-v"))

(define lines-to-print 
  (if has-n-flag? 
      (get-command-line-flag-value-number "-n")
      10))

(define bytes-to-print
  (if has-c-flag?
      (get-command-line-flag-value-number "-c")
      0))

(define (drop-last n lst)
  (reverse (drop n (reverse lst))))

;; if lines-to-print is negative, then it should print all
;; but the absolute last number of lines or bytes.
(define take-or-drop-last
  (let ([things-to-print (if has-c-flag? bytes-to-print lines-to-print)])
    (if (< things-to-print 0) drop-last take)))

(define files-to-print (get-command-line-without-flags flag-map))

(define print-file-headers? 
  (if (and (not has-q-flag?) (not has-v-flag?))
      (> (length files-to-print) 1)
      (not (command-line-flag-comes-before? "-v" "-q"))))

(define (head-by-lines file-name)
  (let* ([lines (file->lines file-name)]
         [first-lines (take-or-drop-last (abs lines-to-print) lines)]
         [output (string-intersperse first-lines "\n")])
  (sprintf "~A\n" output)))

(define (head-by-bytes file-name)
  (let* ([file-str (file->string file-name)]
         ;; This is a bit of a hack.  It's not clear that it would work for binary files.
         [take-drop-extra-bytes (if (< bytes-to-print 0) -1 0)]
         [first-bytes (list->string (take-or-drop-last (+ (abs bytes-to-print) take-drop-extra-bytes) (string->list file-str)))])
  first-bytes))

(define output-function (if has-c-flag? head-by-bytes head-by-lines))

(define (head-file file-name)
    (when print-file-headers? (printf "==> ~A <==\n" file-name))
    (display (output-function file-name)))

(define (head-files)
  (define (loop files) 
    (when (not (empty? files))
      (head-file (car files))
      (loop (cdr files))))
  (loop files-to-print))

(maybe-print-version-and-quit version-string)

(head-files)