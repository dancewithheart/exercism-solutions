(ns leap)

(defn leap-year?
  "Returns true if the given year is a leap year;
  otherwise, it returns false."
  [year]
  (or
    (zero? (mod year 400))
    (and (zero? (mod year 4)) (not (zero? (mod year 100)))
  )))
