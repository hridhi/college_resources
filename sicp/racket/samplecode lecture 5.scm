#lang racket


(define (sqrt x)
  (sqrt-iter 1.0 x)
 )

(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)
        )
)


(define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001)
)


(define (improve guess x)
        (average guess (/ x guess))
)

(define (square x)
        (* x x)
)

(define (average x y)
        (/ (+ x y) 2)
)

(sqrt 2)
;##############################################################

;######################################################################### LOCALIZED PROCEDURES

(define (sqrt x)
  
        (define (good-enough? guess x)
                (< (abs (- (square guess) x)) 0.001)
         )
        (define (improve guess x)
                (average guess (/ x guess))
         )
  
        (define (sqrt-iter guess x)
                (if (good-enough? guess x)
                     guess
                    (sqrt-iter (improve guess x) x)
                 )
         )
  
        (sqrt-iter 1.0 x)
)

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(sqrt 2)


;##############################################################################################################


; (EXAMPLE WHEN SQUARE IS PLACED OUTSIDE SQRT() PROCEDURE AND IS INCORRECTLY MODIFIED TO  (+ X X) INSTEAD OF (* X X))
#lang racket
(require br/verbose-app)

(define (sqrt x)
        (define (good-enough? guess x)
                (< (abs (- (square guess) x)) 0.001)
         )
        (define (improve guess x)
                (average guess (/ x guess))
         )
  
        (define (sqrt-iter guess x)
                (if (good-enough? guess x)
                     guess
                    (sqrt-iter (improve guess x) x)
                 )
         )
  
        (sqrt-iter 1.0 x)
)

(define (square x)
  (+ x x))

(define (average x y)
  (/ (+ x y) 2))

(sqrt 2)
; INCORRECT ANSWER OF (1.0). SEE PROCEDURAL STEPS TO FOLLOW THE EXPRESSION EVALUATIONS 



;#####################################################################################3
; PLACE THE INCORRECT SQUARE()FUNCTION OUTSIDE THE SQRT() AND PLACE THE CORRECT SQUARE FUNCTION INSIDE THE SQRT(). IN SHORT WE HAVE TWO SQUARE ()
; PROCEDURES: BUT THE SQRT () FUNCTION AUTOMATICALLY SELECTS THE LOCALLY DEFINED SQUARE () FUNCTION BY DISCARDING THE EXTENAL SQUARE().
#lang racket
(require br/verbose-app)

(define (sqrt x)
        (define (good-enough? guess x)
                (< (abs (- (square guess) x)) 0.001)
         )
        (define (improve guess x)
                (average guess (/ x guess))
         )
  
        (define (sqrt-iter guess x)
                (if (good-enough? guess x)
                     guess
                    (sqrt-iter (improve guess x) x)
                 )
         )

          (define (square x)
                  (* x x))
  
        (sqrt-iter 1.0 x)
)

(define (square x)
  (+ x x))

(define (average x y)
  (/ (+ x y) 2))

(sqrt 2)

;########################################################## REMOVING REPETITIVE PASSING OF ARGUMENT X


#lang racket
(require br/verbose-app)

(define (sqrt x)
        (define (good-enough? guess)
                (< (abs (- (square guess) x)) 0.001)
         )
        (define (improve guess)
                (average guess (/ x guess))
         )
  
        (define (sqrt-iter guess)
                (if (good-enough? guess)
                     guess
                    (sqrt-iter (improve guess))
                 )
         )

          (define (square y)
                  (* y y))
  
        (sqrt-iter 1.0)
)


(define (average x y)
  (/ (+ x y) 2))

(sqrt 2)

;#####################################################################33

;####################################################################
;Cuberoot



