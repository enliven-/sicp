
(define (filtered-accumulate filter-fn combiner f a b next base-val)
  (if (> a b)
      base-val
      (let ((par-ans (filtered-accumulate filter-fn combiner f (next a) b next base-val)))
        (if (filter-fn a)
            (combiner (f a) par-ans)     
            (combiner base-val par-ans)))))



; summing odds instead of primes - would have to rewrite prime?
(define (sum-of-squares-of-odds a b)
  
  (define (square x)
    (* x x))
  
  (define (next x)
    (+ x 1))
  
  (filtered-accumulate odd? + square a b next 0))