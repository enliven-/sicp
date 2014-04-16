(load "lib.scm")


(define (sum-odd-squares low high)
  (accumulate  +
              0
              (map square (filter odd?
                                   (enumerate low high)))))



(define (even-fibs n)
  (accumulate cons
              nil
              (map fib (filter even?
                               (enumerate 1 n)))))



(define (fib-squares n)
  (accumulate cons
              nil
              (map square (map fib (enumerate 0 (- n 1))))))

 