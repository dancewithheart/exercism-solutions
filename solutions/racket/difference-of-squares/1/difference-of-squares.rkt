#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares n)
  (fold-sum n square))

(define (square-of-sum n)
  (square (fold-sum n)))

(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))

(define (square n) (* n n))

; fold (natural induction) over number n
(define (fold-sum n [f identity] [init 0])
  (if (<= n 0)
      init
      (+ (f n) (fold-sum (sub1 n) f))))