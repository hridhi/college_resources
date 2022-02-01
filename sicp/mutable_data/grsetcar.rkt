#lang sicp
(define x '((a b) c d))
(define y '(e f))
x
y
(set-car! x y)
x
;(set-cdr! x y)
;x
(define z (cons y (cdr x)))
z

;(set-cdr! (cadr y) x)

#|(let ((x (list 1 2 3));x==>(1 2 3)
(y (list 4 (list 5) 6)));y==>(4 (5) 6)
  (set-cdr! (cadr y) x);(4 (5 1 2 3) 6)
(set-car! x (caadr y));
y)
|#