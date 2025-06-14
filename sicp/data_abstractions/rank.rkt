#lang racket
(define (rank matrix)
  (define lead 0) 
  (define rowCount (rows matrix))
  (define colCount (col matrix))
  (for ([r (in-range 0 rowCount)])
    (if (and (= colCount lead) (< colCount lead))
        (display "end")
        (break))
    (define i r )
    (while (=  (access-elem matrix i lead) 0);access element ---done
           (+ i 1)
            (if (= rowCount i )
                ((set! i r)
                 (+ lead 1)
                 (if (= colCount i)
                     (display "end")
                     (break))
                 )
                (break))
            )
    ;swap row i and r
    (define rowi (access-row matrix i)); extracted rows -- done
    (define rowr (access-row matrix r))
    
    (if (!= (access-elem matrix r lead) 0) ; access ele--done
        (define val (access-elem matrix r lead))
       (set! matrix (divide matrix r val)) ; divide by m[r,lead]--done
        )
    (for ([i (in-range 0 rowCount)])
      (if (! i r)
          (set! matrix (multiply matrix r val))
           (set! matrix (change-at-row matrix i r))
          ; sub (x multiplied by row r ) from row i---done
          ; substract elements in row i by row r --done
          (break)
          )
      )
    (+ lead 1)
    ))