;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.21|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define (smallest-devisor n)
  (find-devisor n 2))

(define (find-devisor n test-devisor)
  (cond ((> (square test-devisor) n) n)
        ((devides? test-devisor n) test-devisor)
        (else (find-devisor n (+ test-devisor 1)))))

(define (devides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(smallest-devisor 199) 
(smallest-devisor 1999) 
(smallest-devisor 19999)


           