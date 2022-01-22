(declare (uses unistd))

(import (chicken format))

(define euid (geteuid))
(define username (get-pw-name euid))
(define gid (get-pw-group-id euid))

(printf "uid=~A(~A) gid=~A\n" euid username gid)