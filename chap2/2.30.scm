

(define (square-tree tree)
  (if (null? tree)
      tree  
      (let ((first (car tree))
            (rest  (cdr tree)))
        (cond
          ((atom? first) (cons (* first first) (square-tree rest)))
          (else
            (cons (square-tree first) (square-tree rest)))))))

(print (square-tree
         (list 1
               (list 2 (list 3 4) 5)
               (list 6 7))))
