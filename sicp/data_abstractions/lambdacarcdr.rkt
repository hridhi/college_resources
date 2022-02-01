#lang racket
;(require br/verbose-app)
(define (pair x y)
  (lambda (m) (m x y)))

 (define (first p) 
  (p (lambda (a b) a)))

(first (pair 3 4))


(define (second p) 
  (p (lambda (a b) b))
)
(second (pair 3 4))