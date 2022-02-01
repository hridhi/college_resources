#lang racket
(require racket/stream)
(define d (stream-cons 'x 'y))
(stream-first d )
(stream-rest d)
