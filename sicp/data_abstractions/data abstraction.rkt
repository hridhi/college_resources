#lang sicp
;; defining constructor and selectors 
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

;; defining print function 
(define (print-rat x)
(newline)
(display (numer x))
(display "/" )
(display (denom x)))

;;creating objects 
(define x (make-rat 1 3 ))
(print-rat x)
(define y (make-rat 1 2 ))
(print-rat y)

;;Functionalities 
(define (add-rat x y)
(make-rat (+(* (numer x)(denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (sub-rat x y)
(make-rat (-(* (numer x)(denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (mul-rat x y)
(make-rat (*(* (numer x)(denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (div-rat x y)
(make-rat (* (numer x)(denom y))
(* (numer y) (denom x))))

(define (equal-rat? x y)
(=(*(numer x)(denom y))
(* (numer y) (denom x))))

;;sample operations on x and y 
(print-rat (add-rat x y))
(print-rat (mul-rat x y))

(define z (add-rat x y))
(print-rat z)



