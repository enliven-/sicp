(load "lib.scm")

(define (constant? exp)
  (number? exp))

(define (variable? exp)
  (symbol? exp))

(define (same-var? var1 var2)
  (and (variable? var1)
       (eq? var1 var2)))


(define (=number? exp num)
  (and (number? exp) (= exp num)))


(define (make-sum a . b)
  (cond
    ((=number? a 0) b)
    ((=number? b 0) a)
    ((and (number? a) (number? b)) (+ a b))
    (else
      (list '+ a b))))


(define (make-product x y)
  (cond
    ((or (=number? x 0) (=number? y 0)) 0)
    ((=number? x 1) y)
    ((=number? y 1) x)
    ((and (number? x) (number? y)) (* x y))
    (else
      (list '* x y))))

(define (make-expt exp n)
  (cond
    ((=number? exp 0) 0)
    ((=number? exp 1) 1)
    ((=number?   n 0) 1)
    ((=number?   n 1) exp)
    (else
      (list '^ exp n))))


(define (sum? exp)
  (and (pair? exp)
       (eq? (car exp) '+)))

(define (product? exp)
  (and (pair? exp)
       (eq? (car exp) '*)))

(define (expt? exp)
  (and (pair? exp)
       (eq? (car exp) '^)))


(define (augend sum-exp)
  (cadr sum-exp))





(define (multiplicand prod-exp)
  (cadr prod-exp))

(define (multiplier prod-exp)
  (caddr prod-exp))


(define (base expt-exp)
  (cadr expt-exp))

(define (powr expt-exp)
  (caddr expt-exp))


(define (derivative exp var)
  (cond
    ((constant? exp) 0)
    ((variable? exp) (if (same-var? exp var) 1 0))
    ((sum? exp) (make-sum (derivative (augend exp) var)
                          (derivative (addend exp) var)))
    ((product? exp) (make-sum (make-product (multiplicand exp)
                                            (derivative (multiplier exp) var))
                              (make-product (multiplier exp)
                                            (derivative (multiplicand exp) var))))
    ((expt? exp) (make-product (powr exp)
                                (make-product (make-expt (base exp)
                                                         (- (powr (exp)) 1))
                                              (derivative exp var))))
    (else
      (error "unkown expression type: DERIVATIVE " exp))))

