
(define (reverse lst)
  
  (define (rev-h lst rvrsdlst)
    (if (null? lst)
        rvrsdlst
        (rev-h (cdr lst) (cons (car lst) rvrsdlst))))
  
  (rev-h lst '()))


