(import (chicken foreign))

(declare (uses get-pw-name))


(define geteuid
    (foreign-lambda* int ()
    "
    C_return(geteuid());
    "))

(define euid (geteuid))
(print (get-pw-name euid))

