#lang racket
(define (qbrt-iter quess prev-quess x)
  (if (good-enought? quess prev-quess)
      quess
      (qbrt-iter (improve quess x) quess x)))

(define (improve quess x)
  (average (/ x (sqr quess)) (* 2 quess)))

(define (sqr x)
  (* x x))

(define (average x y)
  (/ (+ x y) 3))

(define (good-enought? quess prev-quess)
  (< (abs (/ (- quess prev-quess) prev-quess)) 0.0001))

(qbrt-iter 1.0 0.5 27)