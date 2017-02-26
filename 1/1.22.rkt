

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

(define(prime? n)
  (= n (smallest-devisor n)))


(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n)))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))


(define (search-for-prime begin end)
  (cond ((devides? 2 begin) (search-for-prime-iter (+ begin 1) end))
        (else (search-for-prime-iter begin end))))

(define (search-for-prime-iter begin end)
  (if (< begin end)
      (step begin end)))

(define (step begin end)
  (timed-prime-test begin)
  (search-for-prime-iter (+ begin 2) end))

(search-for-prime 1000 20000)