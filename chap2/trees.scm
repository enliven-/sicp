
(list 1 2 (list 3 4) 5 (list 6))

(define (count-leaves struc)
  (print struc)
  (if (null? struc)
      0
      (if (atom? struc)
          1
          (+ (count-leaves (car struc))
             (count-leaves (cdr struc))))))


;; cddadar
;; caar

;; 2.26
(define x (list 1 2 3))
(define y (list 4 5 6))

(print (append x y))
(print (cons x y))
(print (list x y))