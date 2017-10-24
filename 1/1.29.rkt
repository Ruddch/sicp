#lang racket

(define (simpson f a b n)
  
  (define h(/ (- b a) n))
  
  (define (yVal k)
    (define (coef k)
      (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2) 
            (else 4)))
    (* (coef k) (f (+ a (* k h)))))
  (define (inc k)
    (+ k 1))
  (/ (* h (sum yVal 0 inc n)) 3))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube n)
  (* n n n))

(simpson cube 0 1 1000)



        
         