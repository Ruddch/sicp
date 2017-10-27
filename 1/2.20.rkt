#lang racket
(define (same-parity first . ls) 
  (define (accept-parity? value) 
    (equal? (even? first) (even? value))) 
  (define (filter-parity values) 
    (cond ((null? values) null) 
          ((accept-parity? (car values)) (cons (car values) 
                                               (filter-parity (cdr values)))) 
          (else (filter-parity (cdr values))))) 
  (cons first (filter-parity ls)))

(same-parity 1 2 3 4 5 6)
  