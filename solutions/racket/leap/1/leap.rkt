#lang racket

(provide leap-year?)

(define (leap-year? year)
  (cond
    [(modulo? year 400) #t]
    [(and (modulo? year 4) (not (modulo? year 100))) #t]
    [else #f]))

(define (modulo? n m) (= 0 (modulo n m)))