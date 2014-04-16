
(define (tree-map f tree)
  (if (null? tree)
      tree
      (let ((first (car tree))
            (rest  (cdr tree)))
        (cond
          ((atom? first) (cons (f first) (tree-map f rest)))
          (else
            (cons (tree-map f first) (tree-map f rest)))))))


(define (square x) (* x x))

(define (square-tree tree)
  (tree-map square tree))

(print (square-tree
         (list 1
               (list 2 (list 3 4) 5)
               (list 6 7))))

;; also writing flatten the way tree-map works
(define (flatten1 f tree)
  (if (null? tree)
      tree
      (let ((first (car tree))
            (rest  (cdr tree)))
        (cond
          ((atom? first) (cons (f first) (flatten1 f rest)))
          (else
            (append (flatten1 f first) (flatten1 f rest)))))))


(print (flatten1 (lambda (x) x) (list 1 (list 2 (list 3 4) 5) (list 6 7))))