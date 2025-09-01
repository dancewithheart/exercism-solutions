#lang racket

(provide response-for)

(define (question? prompt) (string-suffix? prompt "?"))
(define (silence? prompt) (equal? (string-trim prompt) ""))
(define (all-caps? prompt) (equal? (string-upcase prompt) prompt))
(define (has-chars? prompt) (not (equal? (string-downcase prompt) (string-upcase prompt))))
(define (yell? prompt) (and (has-chars? prompt) (all-caps? prompt)))

(define (response-for prompt)
  (cond [(and (yell? prompt) (question? prompt)) "Calm down, I know what I'm doing!"]
        [(question? prompt) "Sure."]
        [(silence? prompt)  "Fine. Be that way!"]
        [(yell? prompt)     "Whoa, chill out!"]
        [else               "Whatever."]))

