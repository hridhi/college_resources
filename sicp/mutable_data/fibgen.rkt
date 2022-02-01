#lang racket
(define (fibgen a b)
(stream-cons a (fibgen b (+ a b))))
(define fibs (fibgen 0 1))