(import (chicken process-context)
        (chicken string) (chicken format))

(declare (uses list-util))

(define (enforce-minimum-commmand-line-args n error-message)
  (if (< (length (command-line-arguments)) n)
      (error error-message)))

(define (command-line-has-flag? flag)
  (any? (lambda (a) (string=? flag a))
        (command-line-arguments)))

(define (get-command-line-flag-value flag)
  (if (command-line-has-flag? flag)
      (let ((sl (member flag (command-line-arguments))))
           (if (< (length sl) 2)
               ""
               (second sl)))
      ""))

(define (get-command-line-without-flags flag-map)
  (define (loop flags i)
    (if (empty? flags) 
        i
        (let* ((flag-entry (first flags)) 
               (the-flag (first flag-entry)) 
               (flag-has-param (second flag-entry)))
          (if (command-line-has-flag? the-flag)
              (if (eq? flag-has-param #t)
                  (loop (rest flags) (+ i 2))
                  (loop (rest flags) (+ i 1)))
              (loop (rest flags) i)))))
  (drop (loop flag-map 0) (command-line-arguments)))

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

(if (command-line-has-flag? "-a")
    (display-basenames names)
    (display-basenames (list (first names))))
