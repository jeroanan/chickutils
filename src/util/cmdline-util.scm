(declare (unit cmdline-util))
(declare (uses list-util))

(import (chicken process-context))

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
