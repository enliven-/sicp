(load "lib.scm")


(define (prime-sum? pair)
  (prime? (+ (car  pair)
             (cadr pair))))


(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap (lambda (i)
                          (map (lambda (j) (list i j))
                               (enumerate 1 (- i 1))))
                        (enumerate 1 n)))))


(define (remove item lst)
  (filter (lambda (x) (not (= x item))) lst))


(define (permutations s)
  (if (null? s)
      (list s)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))