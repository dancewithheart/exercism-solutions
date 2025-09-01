#lang racket

(provide square total)

(define (square n)
  (expt 2 (sub1 n)))

(define (total)
  (fold-sum 64 square))

; fold (natural induction) over number n
(define (fold-sum n [f identity] [init 0])
  (if (<= n 0)
      init
      (+ (f n) (fold-sum (sub1 n) f))))
