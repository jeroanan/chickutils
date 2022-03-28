(import (chicken process-context)
        (chicken string))

(declare (uses list-util))

(define args (command-line-arguments))

(when (< (length args) 1)
  (error "Missing operand"))

(define the-dir (first args))
(define components (string-split the-dir "/" #t))
(define output (if (string=? (last components) "") "/" (last components)))

(print output)


