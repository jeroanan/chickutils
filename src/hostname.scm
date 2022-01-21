(import (chicken foreign)
        (chicken format))

(define hostname
    (foreign-lambda* c-string () 
    "
    char hostname[99];
    int result;
    result = gethostname(hostname, 99);
    C_return(hostname);
    "))

(printf "~A\n" (hostname))
