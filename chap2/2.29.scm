
;; implementation
;; a)
(define (make-mobile left right)
  (list left right))


(define (make-branch len struc)
  (list len struc))


(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-struc branch)
  (car (cdr branch)))


;; first level api
;; b)

(define (simple-weight? struc)
  (number? struc))


(define (total-weight struc)
  (if (simple-weight? struc)
      struc
      (+ (total-weight (branch-struc (left-branch struc)))
         (total-weight (branch-struc (right-branch struc))))))


(define (torque branch)
  (* (branch-length branch)
     (total-weight (branch-struc branch))))

(define (balanced? mobile)
  (if (simple-weight? mobile)
      #t
      (= (torque (left-branch mobile))
         (torque (right-branch mobile)))))



;; imported tests

(define level-1-mobile (make-mobile (make-branch 2 1) 
                                    (make-branch 1 2))) 
(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                    (make-branch 9 1))) 
(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                    (make-branch 8 2))) 


 
(print (balanced? level-3-mobile))