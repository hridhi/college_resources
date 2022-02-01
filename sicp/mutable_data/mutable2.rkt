#lang sicp
#lang racket
(require sdraw)
(let ((x (list 1 2 3))
      (y (list 4(list 5)6)))
(set-cdr! (cadr y) x)
(set-car! x (caadr y))
  y)