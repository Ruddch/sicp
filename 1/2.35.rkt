#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (ac-count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x)
                                       (ac-count-leaves x) 1))
                       t)))