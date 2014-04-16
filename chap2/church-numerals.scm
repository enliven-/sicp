

;; helper blog - http://www.billthelizard.com/2010/10/sicp-26-church-numerals.html

;; mind finsihed done exploded over
;; numbers as procedures

(define zero (lambda (f) (lambda (x) x)))

(define one  (lambda (f) (lambda (x) (f x))))

(define two  (lambda (f) (lambda (x) (f (f x)))))


;; first-level api
;; also used for testing

(define (inc n)
  (+ n 1))


(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (add-church m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))