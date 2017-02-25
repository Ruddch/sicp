#lang racket
(define (*_1 a b)
  (cond ((= b 0) 0)
        ((even? b) (*_1(double a) (halve b)))
        (else (*_1 (+ a b) (- b 1)))))

(define (*_2 a b)
  (difene (iter a b c)
    (cond ((= b 0) 0)
          ((even? b) (iter (double a) (halve b) c))
          (else (+ a (* a (- b 1) (+ c a)))))))
  
