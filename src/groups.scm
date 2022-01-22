(declare (uses grp))

(import (chicken foreign)
        (chicken format))

(define number-of-groups (get-number-of-groups))
(define group-ids (get-groups))
(define groups-list (groups->list group-ids))

(define (groups)
    (define (loop gids result)
        (if (= (length gids) 0)
            result
            (let* ([this-group (list-ref gids 0)]
                   [group-name (get-group-name this-group)]
                   [sep (if (string=? result "") "" " ")]
                   [thisstr (format "~A" group-name)])       
                (loop (cdr gids) (format "~A~A~A" result sep thisstr)))))
    (loop groups-list ""))

(print (groups))
    
