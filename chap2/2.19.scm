
(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))


(define (empty? lst)
  (null? lst))

(define (cc amount coins-list)
  (cond 
    ((= amount 0) 1)
    ((or (< amount 0) (empty? coins-list)) 0)
    (else
      (+ (cc amount (cdr coins-list))
         (cc (- amount (car coins-list))
             coins-list)))))

;; usage

;(cc 100 us-coins)
;; 292