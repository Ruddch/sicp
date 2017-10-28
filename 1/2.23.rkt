#lang racket
(define (for-each f ls)
  (cond (not (null? ls))
      (f (car ls))(for-each f (cdr ls))))