(define (square n) (* n n))

(define (pow base exp)
  (if (zero? exp)
      1
      (let ((half (pow base (floor (/ exp 2)))))
        (if (even? exp)
            (* half half)
            (* base half half)))))

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (repeatedly-cube (- n 1) (* x x x))))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))
