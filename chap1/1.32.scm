
; a)
(define (accumulate combiner f a b next base-val)
  (if (> a b)
      base-val
      (combiner (f a)
                (accumulate combiner f (next a) b next base-val))))


(define (sum-f-over f a b next)
  (accumulate + f a b next 0))


(define (product-f-over f a b next)
  (accumulate * f a b next 1))




; b)
(define (accumulate-iter combiner f a b next base-val)
  
  (define (acc-iter-h a result)
    (if (> a b)
        result
        (acc-iter-h (next a) (combiner (f a) result))))

  (acc-iter-h a base-val))
