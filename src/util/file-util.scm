(import (chicken io)
        (chicken string)
        (chicken file)
        (chicken format))

(declare (unit file-util))

include(./filesystem-macros.scm.m4)
;; m4 macro -- expanded at compile time from filesystem-macros
MACRO_WITH_FILE_EXISTS

;; m4 macro -- expanded at compile time from filesystem-macros
MACRO_WITH_FILE_READABLE

(define (_file->string file)
  (let ([fh (open-input-file file)])
    (define (loop ls)
      (let ([l (read-line fh)]
            [sep (if (= (string-length ls) 0) "" "\n")])
        (if (eof-object? l) 
          (begin
            (close-input-port fh)
            ls)
          (loop (conc ls sep l)))))
    (loop "")))

(define (file->string file)
  (with-file-exists file
    (with-file-readable file
      (_file->string file))))

(define (file->lines file)
  (let ([file-contents (file->string file)])
    (string-split file-contents "\n" #t)))
