(declare (unit filesystem-macros))

(module filesystem-macros (with-file-exists with-file-readable)
(import scheme)
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
          (exit)))))))