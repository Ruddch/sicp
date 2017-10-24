#lang racket

(define (accumulate1 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))

(define (accumulate2 combiner null-value term a next b) 
  (if (> a b) 
      null-value 
      (combiner (term a) 
                (accumulate2 combiner null-value term (next a) next b))))

(define (sum term a next b) 
  (accumulate1 + 0 term a next b))

(define (product term a next b) 
  (accumulate2 * 1 term a next b))