#lang planet neil/sicp
(define (f n)
  (if (< n 3) n
      (+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))

(define (f_2 n)
  (define (f_2-iter a b c count)
    (if (= n 0) c
        (f_2-iter (+ a b c) a b (- count 1))))
  (f_2-iter 2 1 0 n))