(import (chicken foreign)
        (chicken format))

(declare (uses unistd))

(printf "~A\n" (gethostid))