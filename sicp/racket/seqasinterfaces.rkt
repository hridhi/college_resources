#lang sicp
(define (accumulate op initial sequence)  (if (null? sequence)
initial
(op (car sequence)
(accumulate op initial (cdr sequence)))
))

(define (filter predicate sequence)
(cond ((null? sequence) nil)
((predicate (car sequence))
(cons (car sequence)
(filter predicate (cdr sequence))))
(else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)  (if (> low high)
nil
(cons low
(enumerate-interval (+ low 1) high)
)))

(define (fib n)
(fib-iter 1 0 n))
(define (fib-iter a b count)
(if (= count 0)
b
(fib-iter (+ a b) a (- count 1))))

(define (even-fibs n)
(accumulate cons
nil
(filter even?
(map fib
(enumerate-interval 0 n)))))

(define (square x) (* x x))

(define (enumerate-tree tree)
(cond ((null? tree) nil)
((not (pair? tree)) (list tree))
(else (append (enumerate-tree (car tree))
(enumerate-tree (cdr tree))))))

(define (sum-odd-squares tree)
(accumulate +
0
(map square
 (filter odd?
(enumerate-tree tree)))))

(define (list-fib-squares n)
(accumulate cons
 nil
(map square
(map fib
(enumerate-interval 0 n)))))

#|(define (product-of-squares-of-odd-elements sequence)
(accumulate *
1
(map square
(filter odd? sequence))))|#




