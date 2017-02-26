(define (square x) 
  (* x x))

(define (miller-rabin-test n) 
  (define (try-it a)
    (= (expmod_2 a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod_2 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-or-trivial (expmod_2 base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod_2 base (- exp 1) m)) m))))

(define (remainder-or-trivial k m)  
  (apply-trivial-check k m (remainder (square k) m)))

(define (apply-trivial-check k m r)
  (if (and (not (= k 1)) (not (= k (- m 1))) (= r 1))
      0 
      r))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 6 2)