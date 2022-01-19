;;;; filesystem-macros.import.scm - GENERATED BY CHICKEN 5.3.0 -*- Scheme -*-

(##sys#with-environment
  (lambda ()
    (scheme#eval '(import-syntax scheme))
    (##sys#register-compiled-module
      'filesystem-macros
      'filesystem-macros
      (scheme#list)
      '()
      (scheme#list
        (scheme#cons
          'with-file-readable
          (syntax-rules
            ()
            ((with-file-readable file-name code)
             (if (file-readable? file-name)
               code
               (begin (printf "~A: Cannot read file\n" file-name) (exit))))))
        (scheme#cons
          'with-file-exists
          (syntax-rules
            ()
            ((with-file-exists file-name code)
             (if (file-exists? file-name)
               code
               (begin
                 (printf "~A: No such file or directory\n" file-name)
                 (exit)))))))
      (scheme#list))))

;; END OF FILE
