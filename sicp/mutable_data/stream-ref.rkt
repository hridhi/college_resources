#lang racket
(require racket/stream)

(define (stream-ref s n)
	(if (= n 0)
		(stream-first s)
		(stream-ref (stream-rest s) (- n 1))))

(define (integers-starting-from n)
   (stream-cons n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))