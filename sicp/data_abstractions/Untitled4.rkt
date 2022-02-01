#lang racket



(define (odd a)
  (if (= 0 (remainder a 2)) 0 1 
  ))

(define (fun a b)
  (if (< a b )
  (if ( odd a)
      display(a))
  ( fun (+ a 1 ) b)))


