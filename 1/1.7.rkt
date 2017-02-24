#lang planet neil/sicp
(define (sqrt-iter quess prev-quess x)
  (if (good-enought? quess prev-quess)
      quess
      (sqrt-iter (improve quess x) quess x)))

(define (improve quess x)
  (average quess (/ x quess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enought? quess prev-quess)
  (< (abs (/ (- quess prev-quess) prev-quess)) 0.0001))

(sqrt-iter 1.0 0.5 100)