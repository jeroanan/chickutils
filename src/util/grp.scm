(declare (unit grp))

(import (chicken foreign)
        (chicken memory))

(foreign-declare 
    "
    #include <sys/types.h>
    #include <grp.h>
    ")

(define get-groups
    (foreign-lambda* (c-pointer int) ()
    "
    gid_t* group;
    int numgroups;
    long ngroups_max;

    ngroups_max = sysconf(_SC_NGROUPS_MAX) + 1;
    group = (gid_t *)malloc(ngroups_max *sizeof(gid_t));
    numgroups = getgroups(ngroups_max, group);
    C_return(group);
    "))

(define get-number-of-groups
    (foreign-lambda* int ()
    "
    gid_t* group;
    int numgroups;
    numgroups = getgroups(0, group);
    C_return(numgroups);
    "))

(define get-group-name 
    (foreign-lambda* c-string ((int gid))
    "
    struct group* g;

    g = getgrgid(gid);
    C_return(g->gr_name);
    "))

(define (groups->list groups)
    (define (loop inc res)
        (let* ([p2 (pointer+ groups inc)]
               [gid (pointer-s16-ref p2)])
            (if (= (/ inc 4) number-of-groups)
                res
                (loop (+ inc 4) (append res (list gid))))))
    (loop 0 (list)))
