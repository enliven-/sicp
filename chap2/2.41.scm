(load "lib.scm")


(define (triplets n)
  (map (lambda (i)
         (map (lambda (j)
                (map (lambda (k) 