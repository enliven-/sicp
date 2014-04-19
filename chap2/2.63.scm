(load "lib.scm")

(define (tree:xs tree)
  (if (null? tree)
      '()
      (append (tree:xs (tree:lb tree))
              (cons (tree:nv tree)
                    (tree:xs (tree:rb tree))))))
    



(define (tree:xs* tree)
  
  (define (tree:xs-h tree result-lst)
    (if (null? tree)
        result-lst
        (tree:xs-h (tree:lb tree)
                   (cons (tree:nv tree)
                         (tree:xs-h (tree:rb tree) result-lst)))))
  
  (tree:xs-h tree '()))


