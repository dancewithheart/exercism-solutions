(ns triangle)

(defn triangle?
  "Returns true if the numbers are sides for valid triangle"
  [a b c]
  (and
    (> (* a b c) 0)
    (> (+ a b) c)
    (> (+ a c) b)
    (> (+ b c) a)
    ))

(defn equilateral?
  "Returns true if the triangle with sides a, b, and c is equilateral;
  otherwise, it returns false."
  [a b c]
  (and (triangle? a b c) (== a b c)))

(defn isosceles?
  "Returns true if the triangle with sides a, b, and c is isosceles;
  otherwise, it returns false."
  [a b c]
  (and (triangle? a b c) (or (== a b) (== b c) (== a c))))

(defn scalene?
  "Returns true if the triangle with sides a, b, and c is scalene;
  otherwise, it returns false."
  [a b c]
  (and (triangle? a b c) (not (isosceles? a b c))))
