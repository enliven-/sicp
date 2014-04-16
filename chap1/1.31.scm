; a)
(define (square x)
  (* x x))

(define (product a b f next)
  (if (> a b)
      1
      (* (f a)
         (product (next a) b f next))))


(define (pi-aprx)
  
  (define (f x)
    (/ (* x (+ x 2))
       (square (+ x 1))))
  
  (define (next x)
    (+ x 2))
  
  (* 4
     (product 2 100 f next)))


;b)

(define (product-iter f a b next)
  (define (iter-h a result)
    (if (> a b)
        result
        (iter-h (next a) (* (f a) result))))
  (iter a 1))
