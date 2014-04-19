
(define (set:member? s e)
  (cond
    ((null? s) #f)
    ((equal? e (car s)) #t)
    (else
      (set:member? (cdr s) e))))



(define (set:adjoin s x)
  (if (set:member? s x)
      s
      (cons x s)))



(define (set:intersection s1 s2)
  (cond
    ((or (null? s1) (null? s2)) '())
    ((set:member? s1 (car s2)) (cons (car s2) 
                                     (set:intersection s1 (cdr s2))))
    (else
      (set:intersection s1 (cdr s2)))))



(define (set:union s1 s2)
  (cond
    ((null? s1) s2)
    ((null? s2) s1)
    ((set:member? s1 (car s2)) (set:union s1 (cdr s2)))
    (else
      (set:union (cons (car s2) s1)
                 (cdr s2)))))



    