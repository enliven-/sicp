
;; higher order funcs
(define (filter f lst)
  (if (null? lst)
      lst
      (if (f (car lst))
          (cons (car lst) (filter f (cdr lst)))
          (filter f (cdr lst)))))


(define (accumulate oper base-val lst)
  (if (null? lst)
      base-val
      (oper (car lst) (accumulate oper base-val (cdr lst)))))



(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))



(define (enumerate low high)
  (if (> low high)
      nil
      (cons low (enumerate (+ low 1) high))))


(define (enumerate-tree tree)
  (if (null? tree)
      tree
      (let ((first (car tree))
            (rest  (cdr tree)))
        (if (atom? first)
            (cons first (enumerate-tree rest))
            (append (enumerate-tree first)
                    (enumerate-tree rest))))))


(define (fold-r oper base-val lst)
  (if (null? lst)
      base-val
      (oper (car lst)
            (fold-r oper base-val (cdr lst)))))


(define (fold-l oper base-val lst)
  (if (null? lst)
      base-val
      (oper (fold-l oper base-val (cdr lst))
            (car lst))))


(define (flatmap f  lst)
  (accumulate append nil (map f lst)))




;(define (enumerate-tree-gen tree)
;  (cond
;    ((null? tree) tree)
;    ((atom? tree) (list tree))
;    (else
;      (append (enumerate-tree-gen (car tree))
;              (enumerate-tree-gen (cdr tree))))))

;;; low order

(define nil '())

(define true #t)

(define false #f)

(define (square x)
  (* x x))


;; slow fib
(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))





; for prime?
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


(define (prime? n)
  (fast-prime? n 10))
