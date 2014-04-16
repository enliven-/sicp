
(define (append lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1) (append (cdr lst1) lst2))))




(define (last-pair lst)
  (let ((rest (cdr lst)))
    (if (null? rest)
        lst
        (last-pair rest))))