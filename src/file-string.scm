(import (chicken io)
        (chicken string))

(declare (unit file-string))

(define (file->string file)
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

         
