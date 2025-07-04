#lang racket
(require br/verbose-app)

(define set1 (list 5 3 1 2 4))  ;unordered lists
(define set2 (list 9 7 4 8 1))

(define (element-of-set? x set)
(cond ((null? set) false)
((equal? x (car set)) true)
(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
(if (element-of-set? x set)
 set
(cons x set)))

(define (intersection-set set1 set2)
(cond ((or (null? set1) (null? set2)) '())
((element-of-set? (car set1) set2)
(cons (car set1)
(intersection-set (cdr set1) set2)))
(else (intersection-set (cdr set1) set2))))