
(define (same-parity fst . rst)
  
  (define (filter f lst)
    (if (null? lst)
        lst
        (if (f (car lst))
            (cons (car lst) (filter f (cdr lst)))
            (filter f (cdr lst)))))
  
  (if (odd? fst)
      (filter odd? (cons fst rst))
      (filter even? (cons fst rst))))


      