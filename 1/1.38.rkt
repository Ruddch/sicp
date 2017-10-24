#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(/ 1 (golden))

(define (cont-frac n d k)
  (define (iter i)
    (/ (n i)
       (+ (d i)
          (if (< i k)
              (iter (+ 1 i))
              0))))
  (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
                    
(define (cont-frac-iter n d k) 
  (define (iter i accum) 
    (let ((accum (/ (n i) (+ (d i) accum))) 
          (i (- i 1))) 
      (if (> i 0) 
          (iter i accum) 
          accum))) 
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                100)