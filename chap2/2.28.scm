
(define (flatten struc)

    (define (f-h struc flat-struc)
    (print "step")
    (if (null? struc)
        flat-struc
        (let ((first (car struc))
              (rest  (cdr struc)))
          (if (atom? first)
              (f-h rest (cons first flat-struc))
              (f-h rest (f-h first flat-struc))))))
  
  (reverse (f-h struc '())))
