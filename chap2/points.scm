
; implementation for point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


; first level api
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))


; tests for point
(print-point (make-point 2 3))


; implementation for rectangle
(define (make-rect p1 p2 p3 p4)
  )


; first-level api for rectangle

(define (perimeter r)
  (let ((s1 (side-1-rect r))
        (s2 (side-2-rect r)))
    (* 2 (+ s1 s2))))

(define (area r)
  (let ((s1 (side-1-rect r))
        (s2 (side-2-rect r)))
    (* s1 s2)))

(define (print-rect r)
  (print-point (point-1-rect r))
  (print-point (point-2-rect r))
  (print-point (point-3-rect r))
  (print-point (point-4-rect r)))


  