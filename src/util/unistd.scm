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

(define get-pw-group-id 
    (foreign-lambda* int ((int uid))
    "
    struct passwd* p;

    p = getpwuid(uid);
    C_return(p->pw_gid);
    "))

(define gethostname
    (foreign-lambda* c-string () 
    "
    char hostname[99];
    int result;
    result = gethostname(hostname, 99);
    C_return(hostname);
    "))

(define gethostid
    (foreign-lambda* c-string () 
    "char hex[10];
    sprintf(hex, \"%x\", gethostid());
    C_return(hex);"))