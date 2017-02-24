#lang planet neil/sicp
  (define (sqr x) (* x x))

  (define (sum-of-sqr x y)
    (+ (sqr x) (sqr y)))

  (define (max-sum a b c)
    (cond ((and (> a c) (> b c)) (sum-of-sqr a b))
          ((and (> a b) (> c b)) (sum-of-sqr a c))
          ( else (sum-of-sqr b c))))

  (max-sum 1 2 3)
