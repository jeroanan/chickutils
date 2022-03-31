(import (chicken format))

(declare (uses unistd))

(printf "~A\n" (gethostid))