(declare (unit unistd))

(import (chicken foreign))

(foreign-declare 
    "
    #include <pwd.h>
    ")

(define geteuid
    (foreign-lambda* int ()
    "
    C_return(geteuid());
    "))

(define get-pw-name 
    (foreign-lambda* c-string ((int uid))
    "
    struct passwd* p;

    p = getpwuid(uid);
    C_return(p->pw_name);
    "))
