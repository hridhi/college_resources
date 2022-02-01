#lang racket

;############################################################ Matrix creation ####################################################

(define (creatematrix r c )
  (define mat '()) ;outer array 
  (for ([i (in-range 0 r)])
    (define temp '()) 
    (for ([j (in-range 0 c)])
      (define a (read-line (current-input-port) 'any))  ; taking input 
      (set! temp (append temp (list (string->number a)))) ; reassignment temp 
      )
    (display temp)
    (if (null? mat) ; avoiding empty array at start of matrix 
        (set! mat (list temp))
            (set! mat (append mat (list temp)))) 
    (display mat) ; displaying 
     )
  mat )

;############################################################ helpers ####################################################
(define (access-row matrix x)
(define fla '())
(define w 0)
(for/list ([row matrix] [i (length matrix)])
(for/list ([e row] [j (length row)])
(if (= x i)
    (if (null? fla)
        (set! fla (list e))
        (append fla e))
(+ w 1) )))fla)


(define (change-at-row l x y )
  (for/list ([row l] [i (length l)])
    (for/list ([e row] [j (length row)])
      (if (= x i)
          (- e (access-elem l y j))
          e))))

(define (change-at l x y to)
  (for/list ([row l] [i (length l)]) ; access every row of each matrix 
    (for/list ([e row] [j (length row)]) ; each and every element of that particular row 
      (if (and (= x i) (= y j))
          to
          e)))); returns a matrix 

(define (multiply l r val)
  (for/list ([row l] [i (length l)])
    (for/list ([e row] [j (length row)])
      (if (= i r)
          (* val e)
          e))))

(define (access-elem l x y)
(define fla 0)
(define w 0)
(for/list ([row l] [i (length l)])
(for/list ([e row] [j (length row)])
(if (and (= x i) (= y j))
(set! fla e)
(+ w 1) )))fla)


 

(define (rows matrix)
  (length matrix))

(define (col matrix)
   (length (car matrix)))

;############################################################ addition ####################################################

(define (addmatrix matrix1 matrix2)
  (if (and (= (rows matrix1) (rows matrix2)) (=(col matrix1) (col matrix2))) ; checking rows and columns are equal 
      (map (lambda (matrix1 matrix2) (map + matrix1 matrix2)) matrix1 matrix2) ; using inbuilt map function 
      (display "Dimensions do not match")))

;############################################################ substraction ####################################################

(define (submatrix matrix1 matrix2)
  (if (and (= (rows matrix1) (rows matrix2)) (=(col matrix1) (col matrix2))) ; checking rows and columns are equal 
      (map (lambda (matrix1 matrix2) (map - matrix1 matrix2)) matrix1 matrix2)
      (display "Dimensions do not match"))) ; else part 

;############################################################ multiplication ####################################################

(define (matrixmult matrix1 matrix2)
  (if (= (col matrix1)(rows matrix2)) ; checking condition clo1= rows2 
       (map(lambda (row)
        (apply map
       (lambda column
         (apply + (map * row column))) ; when lists we use apply function 
       matrix2)) 
   matrix1)
      (display "error")))

;############################################################ transpose ####################################################

(define (transpose matrix)                    
  (for/list ((i (length (list-ref matrix 0)))) ; sends result in form of a list 
    (for/list ((il matrix)) ; access the rows of the matrix                    
      (list-ref il i)))) ; access all the rows of ith column (il row ith col) 

;############################################################ determinant ####################################################



;############################################################ extract diagonal elements ####################################################

(define (diagonal matrix) 
  (if (null? matrix) ; if matrix null condition
      '()
      (cons (caar matrix) 
            (diagonal (map cdr (cdr matrix)))))); recursive 

;############################################################ identifying upper triangle matrix ####################################################

(define (upper matrix)
   (define count (rows matrix))
  (if (= (rows matrix) (col matrix)); if square matrix 
 
  (for ([i (in-range 0 (rows matrix))])
    (for ([j (in-range 0 (- (rows matrix) count))]) ; as last row will have rows-1 number of zeroes 
       (set! matrix (change-at matrix i j 0)) ; changing (i,j) position to 0 
    )
    (set! count (- count 1))
    (display matrix); displaying matrix 
    )
  (display "not a square matrix")))

;############################################################ identifying lower triangle matrix ####################################################

(define (lower matrix)
   (define count 1)
  (if (= (rows matrix) (col matrix)); square matrix 
  (for ([i (in-range 0 (rows matrix))]) ; first row will have rows-1 number of 0 
    (for ([j (in-range count (rows matrix))])
       (set! matrix (change-at matrix i j 0))
    )
    (set! count (+ count 1))
    (display matrix) ; displaying matrix 
    )
  (display "not a square matrix")))

;############################################################ rank of matrix ####################################################



;############################################################ inverse of matrix ####################################################



;############################################################ execution ####################################################

;(define x (creatematrix 3 3))
;(define z (creatematrix 3 3))
;(define y (creatematrix 2 3))
;(addmatrix x y)
;(submatrix x y)
;(matrixmult x y)
;(transpose x)
;(diagonal  x)
;(lower x)
;(upper x)