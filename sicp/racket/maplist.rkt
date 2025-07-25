#lang racket

(define ( mymap items proc)  
    (if  (null? items)
          null
              (cons (proc (car items) )
             (mymap(cdr items) proc))
))


#|(define (scale-list items factor)
  (define (mul-item a)
                    (* a factor))
        (mymap items mul-item)
)|#

#|(define (scale-list items factor)
	(mymap items (lambda (x) (* x factor))))|#

#|(define (square-list items)
        (define (square-item a)
                    (* a a)))
(map items square-item)|#

(mymap items square-item)


