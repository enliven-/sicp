(define (fixed-point f first-guess)
  
  (define tolerance .0001)
  
  (define (close-enuf? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  
  (define (fixed-point-h guess)
    (let ((next (f guess)))
      (if (close-enuf? guess next)
          next
          (fixed-point-h next))))
  
  (fixed-point-h first-guess))

(define (average x y)
  (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square x) (* x x))

; now sqrt a number is the fixed point of f (with guess = that number) that is the aver damp of 
; a proc that takes a y and returns (/ x y)

;(define (sqrt x)
;  (fixed-point (average-damp (lambda (y) (/ x y)))
;               1.0))

