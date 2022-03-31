(declare (uses unistd))

(define uid (getuid))
(print (get-pw-name uid))

