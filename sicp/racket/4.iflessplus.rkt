#lang racket
(require br/verbose-app)
(define (less x y) (if (< x y) #t #f))
(define (plus x y) (+ x y))
(define (divide x y) (/ x y))
