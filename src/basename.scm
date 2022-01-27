(import (chicken process-context)
        (chicken string))

(declare (uses list-util))

(define the-dir (first (command-line-arguments)))
(define components (string-split the-dir "/" #t))
(define output (if (string=? (last components) "") "/" (last components)))

(print output)


