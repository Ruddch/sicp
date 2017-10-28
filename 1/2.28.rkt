#lang racket
(define (fringe items)
  (define (iter items res)
    (cond ((null? items) res) 
          ((not (pair? items)) (list items))
          (else (iter (cdr items) (append res (iter (car items) (list)))))))
  (iter items (list)))

(fringe '((1 2)(3 (4 5 6 7))))