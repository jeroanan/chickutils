(declare (unit get-pw-name))

(import (chicken foreign))

(foreign-declare 
    "
    #include <pwd.h>
    ")

(define get-pw-name 
    (foreign-lambda* c-string ((int uid))
    "
    struct passwd* p;

    p = getpwuid(uid);
    C_return(p->pw_name);
    "))
