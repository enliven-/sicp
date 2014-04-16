
(load "lib.scm")


(define (count-leaves tree)
  (accumulate (lambda (x y)
                (cond
                  ((null? x) y)
                  ((atom? x) (+ y 1))
                  (else
                    (+ (count-leaves x) y))))
              0
              tree))




(define (count-leaves2 tree)
  (accumulate (lambda (x y) (+ y 1)) 0 (enumerate-tree tree)))

