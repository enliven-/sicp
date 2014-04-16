(define (deep-reverse lst)
  
  (define (dr-h lst rlst)
    (if (null? lst)
        rlst
        (let ((first (car lst))
              (rest  (cdr lst)))
          (if (atom? first)
              (dr-h rest (cons first rlst))
              (dr-h rest (cons (dr-h first '())
                               rlst))))))
  
  (dr-h lst '()))


(print (deep-reverse (list 1 2 (list 3 4) 5 (list 6 7))))
