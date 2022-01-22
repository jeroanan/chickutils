(declare (uses unistd)
         (uses grp))

(import (chicken format))

(define euid (geteuid))
(define username (get-pw-name euid))
(define gid (get-pw-group-id euid))
(define group-name (get-group-name gid))
(define number-of-groups (get-number-of-groups))
(define groups (get-groups))

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