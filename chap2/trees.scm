;; tree
;; implementation


(define (tree:nv tree)
  (car tree))

(define (tree:lb tree)
  (cadr tree))

(define (tree:rb tree)
  (caddr tree))

(define (tree:new nv lb rb)
  (list nv lb rb))