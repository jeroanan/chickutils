(import (chicken foreign))

(declare (uses unistd))

(define euid (geteuid))
(print (get-pw-name euid))

