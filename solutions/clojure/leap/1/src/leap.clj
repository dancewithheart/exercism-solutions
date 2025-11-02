(ns leap)

(defn leap-year?
  "Returns true if the given year is a leap year;
  otherwise, it returns false."
  [year]
  (or
    (== 0 (mod year 400))
    (and (== 0 (mod year 4)) (not (== 0 (mod year 100)))
  )))
