#lang racket

(provide acronym)

; takes first letter of each word
; ignores _
(define (initial-letter s)
  (string-ref (string-replace s "_" "") 0))

; true if string contains some characters
(define (not-empty? s) (not (equal? "" s)))

; split string into words using space and - as delimiters
(define (words s)
  (filter not-empty? (string-split (string-replace s "-" " ") " ")))

(define (acronym s)
  (string-upcase
    (list->string
     (map
      initial-letter
      (words s)))))