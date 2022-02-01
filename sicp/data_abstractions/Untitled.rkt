#lang racket
(define (dmy d m y)
  (

  cons (cons d m) y
  

   ))

(define (print tot)
  (
    display(cdr tot)
    
  )
  )
       
(define name (dmy 12 02 2000))
(print name)

( let(( x 5))
 (define foo (lambda (y) (bar x y)))
 (define bar(lambda (a b)(+ (* a b)a))) 
   (foo(+ x 3)))

;repetition addition -> mult
; iterative or recursive ?
; recursive 
( define (fun x y)
   (if (> x 0)
       (+ y (fun (- x 1) y)) x))
(fun 2 3)
;iterative


(define (double f)
  (lambda (x) (f(f x ))))
(define (inc x)
  (+ x 1))

(( double (double (double inc))) 5)

((( double (double double)) inc) 5)

(display "even")
