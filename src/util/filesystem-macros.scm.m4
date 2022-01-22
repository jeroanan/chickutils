define(MACRO_WITH_FILE_EXISTS,
  (import scheme)
  (define-syntax with-file-exists
    (syntax-rules ()
      ((with-file-exists file-name code)
        (if (file-exists? file-name) 
          code
          (begin 
            (printf "~A: No such file or directory\n" file-name)
          (exit)))))))dnl

define(MACRO_WITH_FILE_READABLE, 
  (import scheme)
  (define-syntax with-file-readable
    (syntax-rules ()
      ((with-file-readable file-name code)
        (if (file-readable? file-name) 
          code
          (begin 
            (printf "~A: Cannot read file\n" file-name)
            (exit)))))))dnl