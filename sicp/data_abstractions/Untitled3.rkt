
#lang racket 
(define (distance x1 y1 x2 y2)
  ((lambda (a b) (sqrt (+ (* a a) (* b b))))
   (- x1 x2) (- y1 y2)))

(distance 1 2 3 4)

(define (term x) x)
(define (sum f a next b)
  (if (> a b)
      0
      (+ (f a) (sum f term(next a) next b))))

