(import (chicken string) 
        (chicken format))

(declare (uses cmdline-util)
         (uses list-util))

(define version-string "2022.04.02.01")

(define flag-map (list 
                    (list "-a" #f)
                    (list "-s" #t)
                    (list "-z" #f)))

(enforce-minimum-commmand-line-args 1 "Missing operand")

(define (get-basename name) 
  (let ((components (string-split name "/" #t)))
    (if (string=? (last components) "")
        "/"
        (last components))))

(define (display-basenames names)
  (define (loop names) 
    (unless (empty? names) 
      (begin 
        (printf "~A~A" (string-chomp (get-basename (first names)) suffix) line-separator)
        (loop (rest names)))))
  (loop names))

(define has-a-flag (command-line-has-flag? "-a"))
(define has-s-flag (command-line-has-flag? "-s"))
(define has-z-flag (command-line-has-flag? "-z"))

(define names (get-command-line-without-flags flag-map))
(define flag-suffix (get-command-line-flag-value "-s"))
(define line-separator (if has-z-flag "\x00" "\n"))

(define suffix (cond ((and has-a-flag (not has-s-flag)) "")
                     ((and has-a-flag (not (string=? flag-suffix ""))) flag-suffix)  
                     (not (string=? flag-suffix "") flag-suffix)  
                     ((> (length names) 1) (last names))
                     (else "")))

(maybe-print-version-and-quit version-string)

(if (command-line-has-flag? "-a")
    (display-basenames names)
    (display-basenames (list (first names))))
