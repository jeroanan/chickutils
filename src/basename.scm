(import (chicken process-context)
        (chicken string) (chicken format))

(declare (uses list-util))

(define (enforce-minimum-commmand-line-args n error-message)
  (if (< (length (command-line-arguments)) n)
      (error error-message)))

(define (command-line-has-flag? flag)
  (any? (lambda (a) (string=? flag a))
        (command-line-arguments)))

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
        (print (get-basename (first names)))
        (loop (rest names)))))
  (loop names))

(define names (get-command-line-without-flags flag-map))
(if (command-line-has-flag? "-a")
    (display-basenames names)
    (display-basenames (list (first names))))
