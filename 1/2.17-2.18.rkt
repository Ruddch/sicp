#lang racket
(define (last-pair list)
  (list-ref list (- (length list) 1)))
            
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (reverse items) 
  (define (reverse-iter source result) 
    (if (null? source) 
        result 
        (reverse-iter (cdr source) (cons (car source) result)))) 
  (reverse-iter items (list)))

(reverse (list 1 2 3 4))