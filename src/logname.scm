(import (chicken foreign))

(foreign-declare 
    "
    #include <pwd.h>
    ")

(define logname 
    (foreign-lambda* c-string ()
    "
    uid_t uid;
    struct passwd* p;

    uid = getuid();
    p = getpwuid(uid);
    C_return(p->pw_name);
    "))

(print (logname))

