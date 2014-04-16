(define (search f neg-point pos-point)
  
  (define (average a b)
    (/ (+ a b) 2.0))
  
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))

  
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? (f midpoint))
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

