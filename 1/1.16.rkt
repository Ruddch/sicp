#lang planet neil/sicp
(define (fast-exp b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          ((iter (* a b) b (- n 1)))))
  (iter 1 b n))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(fast-exp 2 5)