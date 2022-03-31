(import (chicken process-context)
        (chicken string))

(declare (uses file-util)
         (uses list-util))

;; For now, this only prints the first five lines of a single file
(define (head)
  (let* ([file-name (car (command-line-arguments))]
         [lines (file->lines file-name)]
         [first-five (take 5 lines)]
         [output (string-intersperse first-five "\n")])
  (print output)))

(head)