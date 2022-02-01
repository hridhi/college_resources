#lang racket
(define u (cons 2 3))
; in u car=2 and cdr=3 
(define w (cons 5 6))
(define x (cons u w))
(define y (cons w x))
(define z (cons 3 y))
;nested calls 
(cdr(car(cdr(cdr z))))
;the above statement can also be written like
(cdaddr z)