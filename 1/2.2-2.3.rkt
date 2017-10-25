#lang racket
(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point y) (cdr y))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-point segment)
  (car segment))

(define (end-point segment)
  (cdr segment))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-point segment))
                       (x-point (end-point segment)))
              (average (y-point (start-point segment))
                       (y-point (end-point segment)))))
(print-point (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))))


(define (rectangle-perimeter rectangle) 
  (* 2 (+ (rectangle-width rectangle) 
          (rectangle-height rectangle))))
(define (rectangle-area rectangle) 
  (* (rectangle-width rectangle) 
     (rectangle-height rectangle)))
  
(define (make-rectangle topleft bottomright) 
  (cons topleft bottomright))

(define (rectangle-bottomright rectangle) 
  (cdr rectangle))

(define (rectangle-topleft rectangle) 
  (car rectangle))

(define (rectangle-width rectangle) 
  (abs (- (x-point (rectangle-topleft rectangle)) 
          (x-point (rectangle-bottomright rectangle)))))

(define (rectangle-height rectangle) 
  (abs (- (y-point (rectangle-topleft rectangle)) 
          (y-point (rectangle-bottomright rectangle)))))