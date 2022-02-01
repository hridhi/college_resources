#lang sicp
(define mylist (list 'a 'b 'c 'd))
mylist
(set-car! mylist 1)
mylist
;(set-cdr! mylist 4)
;mylist
(define mypair (cons 4 '()))
(set-cdr! (cddr mylist) mypair)
mylist
