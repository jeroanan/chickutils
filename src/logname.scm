(import (chicken foreign))

(declare (uses unistd))

(define getuid
    (foreign-lambda* int ()
    "
    C_return(getuid());
    "))

(define uid (getuid))
(print (get-pw-name uid))

