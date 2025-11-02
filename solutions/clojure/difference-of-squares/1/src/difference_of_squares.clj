(ns difference-of-squares)

(defn square-of-sum
  "Returns the square of the sum of the numbers up to N."
  [N]
  (let [S (/ (* N (+ N 1)) 2)]
    (* S S)))

(defn sum-of-squares
  "Returns the sum of the squares of the numbers up to N."
  [N]
  (/ (* N (+ N 1) (+ (* 2 N) 1)) 6)
  )

(defn difference
  "Returns the difference between the square of the sum
  and the sum of the squares of the numbers up to N."
  [N]
  (- (square-of-sum N) (sum-of-squares N)))
