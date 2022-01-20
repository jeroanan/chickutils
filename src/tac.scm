(import (chicken process-context)
        (chicken string))

(declare (uses file-string))

(define (tac)
  (define (main-loop as)
    (unless (= (length as) 0)
      (begin
        (let* ([file-contents (file->string (car as))]
               [lines (string-split file-contents "\n" #t)]
               [reversed (string-intersperse (reverse lines) "\n")])
          (print reversed)
          (main-loop (cdr as))))))
  (main-loop (command-line-arguments)))

(tac)

