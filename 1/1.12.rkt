#lang planet neil/sicp
(define (pascal elem row)
  (cond ((or (= elem 1) (= row elem)) 1)
        ((and (> row 1) (< elem row)) (+ (pascal elem (- row 1))
                                        (pascal (- elem 1) (- row 1)))
         )
        )
  )
(pascal 3 5)