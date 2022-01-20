(import (chicken process-context)
        (chicken string))

(declare (uses file-string)
         (uses list-util))

;; For now, this only prints the last five lines of a single file
(define (tail)
    (let* ([file-name (car (command-line-arguments))]
           [file-contents (file->string file-name)]
           [lines-split (string-split file-contents "\n" #t)]
           [last-five (reverse (take 5 (reverse lines-split)))]
           [output (string-intersperse last-five "\n")])
        (print output)))

(tail)

