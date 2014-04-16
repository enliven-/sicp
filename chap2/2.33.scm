
(load "lib.scm")

(define (map f lst)
  (accumulate (lambda (x y)
                (cons (f x) y))
              nil
              lst))

(define (length lst)
  (accumulate (lambda (x y) (+ y 1))
              0
              lst))
