
(define (sigma a b f next)
  (if (> a b)
      0
      (+ (f a) (sigma (next a) b f next))))



(define (cube x)
  (* x x x))

(define (identity x)
  x)

(define (inc n)
  (+ n 1))



(define (sum-cubes a b)
  (sigma a b cube inc))


(define (pi-sum a b)
  
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  
  (define (pi-next x)
    (+ x 4))
  
  (sigma a b pi-term pi-next))


(define (integral a b f dx)
  
  (define (add-dx x)
    (+ x dx))
  
  (* (sigma (+ a (/ dx 2.0)) b f add-dx)
      dx))
