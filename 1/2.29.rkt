#lang racket
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((struct (branch-structure branch)))
      (if (pair? struct) (total-weight struct)
          struct)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
    (let ((struct (branch-structure branch)))
      (if (pair? struct) (total-weight struct)
          struct)))

(define (total-length mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (balanced? mobile)
  
  (define (branch-balanced? branch)
    (let ((struct (branch-structure branch)))
      (if (pair? struct) (balanced? struct)
          true)))
  (define (torque=? l r)
    (= (* (branch-length l) (branch-weight l))
       (* (branch-length r) (branch-weight r))))
  
  (let ((l (left-branch mobile))
        (r (right-branch mobile)))
    (and (branch-balanced? l)
         (branch-balanced? r)
         (torque=? l r))))

(total-weight (make-mobile (make-branch 2 4) (make-branch 3 3)))
    