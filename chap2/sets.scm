(load "lib.scm")

;; sets as binary trees


;; implementation as trees
(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))


;; first level api
(define (element-of-set? s x)
  (cond
    ((null? s) false)
    ((= x (entry s)) true)
    ((< x (entry s)) (element-of-set? (left-branch tree) x))
    ((> x (entry s)) (element-of-set? (right-branch tree) x))))


(define (adjoin-set s x)
  (cond
    ((null? s) (make-tree x nil nil))
    ((= x (entry s)) s)
    ((< x (entry s)) (make-tree (entry s)
                                (adjoin-set (left-branch s) x)
                                (right-branch s)))
    ((> x (entry s)) (make-tree (entry s)
                                (left-branch s)
                                (adjoin-set (right-branch s) x)))))



(define (tree->list1 tree)
  (if )