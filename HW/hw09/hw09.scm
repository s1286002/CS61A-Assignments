(define (curry-cook formals body)
  (if (null? formals)
      body
      (let ((first (car formals))
            (rest  (cdr formals)))
        `(lambda (,first) ,(curry-cook rest body)))))

(define (curry-consume curry args)
  (if (null? args)
      curry
      (let ((first (car args))
            (rest  (cdr args)))
        (curry-consume (curry first) rest))))

(define-macro (switch expr options)
  (switch-to-cond (list 'switch expr options)))

(define (switch-to-cond switch-expr)
  (cons 'cond
    (map
	      (lambda (option) (cons (list 'equal? (car (cdr switch-expr)) (car option)) (cdr option)))
    (car (cdr (cdr switch-expr))))))
