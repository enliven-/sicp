(load "lib.scm")


(define (reverse1 lst)
  (fold-l cons nil lst))