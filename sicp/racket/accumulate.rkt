#lang racket
(require br/verbose-app)
(define (accumulate op initial sequence)  (if (null? sequence)
initial
(op (car sequence)
(accumulate op initial (cdr sequence)))
))
