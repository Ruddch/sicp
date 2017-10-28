#lang racket
(define (deep-reverse items)
  (define (rev items res)
    (cond ((null? items) res) 
          ((not (pair? items)) items)
          (else (rev (cdr items) (cons (rev (car items) (list)) res)))))
  (rev items (list)))

(deep-reverse '((1 2)(3 4)))