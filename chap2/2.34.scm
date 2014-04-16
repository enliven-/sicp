(load "lib.scm")

(define (horner-eval coef-seq x)
  (accumulate (lambda (a y)
                (+ (* y x) a))
              0
              coef-seq))



