(load "lib.scm")

;; sets as binary trees

;; first level api
(define (set:member? s x)
  (cond
    ((null? s) false)
    ((= x (tree:nv s)) true)
    ((< x (tree:nv s)) (set:member? (tree:lb tree) x))
    ((> x (tree:nv s)) (set:member? (tree:rb tree) x))))


(define (set:adjoin s x)
  (cond
    ((null? s) (make-tree x nil nil))
    ((= x (tree:nv s)) s)
    ((< x (tree:nv s)) (make-tree (tree:nv s)
                                (adjoin-set (tree:lb s) x) ;; dispatch to adjoin on left side
                                (tree:rb s)))
    ((> x (tree:nv s)) (make-tree (tree:nv s)
                                (tree:lb s)
                                (adjoin-set (tree:rb s) x)))))


