#lang racket
(require br/verbose-app)
(define (filter predicate sequence)
(cond ((null? sequence) null)
((predicate (car sequence))
(cons (car sequence)
(filter predicate (cdr sequence))))
(else (filter predicate (cdr sequence)))))
