#lang racket

;(require br/verbose-app)
;we can write constructor and selector together

(define (pair x y) 
  (define (dispatch m)
	(cond ((= m 0) x) ; car of the pair 
	      ((= m 1) y) ; cdr of pair 
	(else (error "Argument not 0 or 1")))
    ) 
dispatch)

(define (first p)  (p 0))
(define (second p) (p 1))

(first (pair 3 4))
(second (pair 3 4))

((pair 5 6)0)