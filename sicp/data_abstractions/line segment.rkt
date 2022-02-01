#lang racket
(define (make-point x y) (cons x y))
(define p1 (make-point 2 3))
(define p2 (make-point 8 6))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p) 
  (newline) 
  (display "(") 
  (display (x-point p)) 
  (display ",") 
  (display (y-point p)) 
  (display ")")
)

(print-point p1)
(print-point p2)

(define (make-segment start-point end-point) 
   			(cons start-point end-point)) 
		 (define line1 (make-segment p1 p2))

(define (start-segment segment) (car segment)) 
 		(define (end-segment segment) (cdr segment))
		(car line1)
		(cdr line1)

(define (print-segment p) 
   			(newline) 
   			(display "(") 
   			(display (start-segment p)) 
  			(display "--------------") 
   			(display (end-segment p)) 
   			(display ")")
		)

		(print-segment line1)

(define (midpoint-segment seg) 
   			(average-points (start-segment seg) 
                   			      (end-segment seg)
			))

 (define (average-points a b) 
   			(make-point (average (x-point a) (x-point b)) 
               			(average (y-point a) (y-point b))
			)
		)

(define (average a b)
         (/ (+ a b) 2))
			(define mp (midpoint-segment  line1))










