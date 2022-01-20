(import (chicken foreign)
        (chicken format))

(define hostid
    (foreign-lambda* c-string () 
    "char hex[10];
    sprintf(hex, \"%x\", gethostid());
    C_return(hex);"))

(printf "~A\n" (hostid))