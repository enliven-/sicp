
(load "lib.scm")

(define (dot-product v1 v2)
  (print "dotting " v1 " with " v2)
  (accumulate + 0 (map * v1 v2)))


(define (matrix*vector m v)
  (map (lambda (x) (dot-product x v)) m))


(define (transpose m)
  (accumulate-n cons nil m))

(define (matrix*matrix m1 m2)
  (map dot-product m1 (transpose m2)))

