
(define (cons a b)
  (define (dispatch m)
    (cond ((= m 0) a)
          ((= m 1) b)
          (else error "bad arguments"))))

(define (car pair)
  (pair 0))

(define (cdr pair)
  (pair 1))



; mind blown!
(define (cons x y)
  (lambda (cp) (cp x y)))

(define (car p)
  (p (lambda (a b) a)))

(define (cdr p)
  (p (lambda (a b) b)))

