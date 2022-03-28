(import (chicken process-context)
        (chicken string))

(declare (uses list-util))

(define (enforce-minimum-commmand-line-args n error-message)
  (if (< (length (command-line-arguments)) n)
      (error error-message)))

(enforce-minimum-commmand-line-args 1 "Missing operand")

(define args (command-line-arguments))
(define the-dir (first args))
(define components (string-split the-dir "/" #t))
(define output (if (string=? (last components) "") "/" (last components)))

(print output)


