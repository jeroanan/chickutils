(import (chicken foreign))

(declare (uses unistd))


(define geteuid
    (foreign-lambda* int ()
    "
    C_return(geteuid());
    "))

(define euid (geteuid))
(print (get-pw-name euid))

