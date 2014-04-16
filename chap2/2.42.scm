(load "lib.scm")

(define empty-board '())

; board representation of cols with queens
; (list 6 3 1 7 5 8 2 4)

; q 
;
;
(define (safe? k placed-queens)
  (map (lambda (p) (not 


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position
                       new-row k rest-of-queens))
                   (enumerate 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))
