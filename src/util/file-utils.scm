(import (chicken io)
        (chicken string)
        (chicken file)
        (chicken format))

(declare (unit file-string))

(define-syntax with-file-exists
  (syntax-rules ()
    ((with-file-exists file-name code)
      (if (file-exists? file-name) 
        code
        (begin 
          (printf "~A: No such file or directory\n" file-name)
          (exit))))))

(define-syntax with-file-readable
  (syntax-rules ()
    ((with-file-readable file-name code)
      (if (file-readable? file-name) 
        code
        (begin 
          (printf "~A: Cannot read file\n" file-name)
          (exit))))))

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

         
