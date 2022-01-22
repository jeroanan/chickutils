(declare (uses unistd))

(import (chicken foreign)
        (chicken format)
        (chicken memory))

(foreign-declare 
    "
    #include <sys/types.h>
    #include <grp.h>
    ")

(define get-group-name 
    (foreign-lambda* c-string ((int gid))
    "
    struct group* g;

    g = getgrgid(gid);
    C_return(g->gr_name);
    "))

(define get-number-of-groups
    (foreign-lambda* int ()
    "
    gid_t* group;
    int numgroups;
    numgroups = getgroups(0, group);
    C_return(numgroups);
    "))

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

(define euid (geteuid))
(define username (get-pw-name euid))
(define gid (get-pw-group-id euid))
(define group-name (get-group-name gid))
(define number-of-groups (get-number-of-groups))
(define groups (get-groups))

(define (groups->list groups)
    (define (loop inc res)
        (let* ([p2 (pointer+ groups inc)]
               [gid (pointer-s16-ref p2)])
            (if (= (/ inc 4) number-of-groups)
                res
                (loop (+ inc 4) (append res (list gid))))))
    (loop 0 (list)))

(define (group-id-list->string gids)
    (define (loop gids result)
        (if (= (length gids) 0)
            result
            (let* ([this-group (list-ref gids 0)]
                   [group-name (get-group-name this-group)]
                   [sep (if (string=? result "") "" ",")]
                   [thisstr (format "~A(~A)" this-group group-name)])       
                (loop (cdr gids) (format "~A~A~A" result sep thisstr)))))
    (loop gids ""))

(define group-ids (groups->list groups))
(define group-string (group-id-list->string group-ids))
(printf "uid=~A(~A) gid=~A(~A) groups=~A\n" euid username gid group-name group-string)