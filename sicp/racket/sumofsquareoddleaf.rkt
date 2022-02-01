#lang racket
(define (sum-odd-squares tree)
(cond ((null? tree) 0)
((not (pair? tree))
(if (odd? tree) (square tree) 0))
(else (+ (sum-odd-squares (car tree))
(sum-odd-squares (cdr tree))))))

(define x (list(list 1 2 3 4)(list 5 6 7 8))) ;enumeration

(define (square x) (* x x))