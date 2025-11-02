(ns leap)

(defn divide? [n d] (zero? (mod n d)))

(defn leap-year?
  "Returns true if the given year is a leap year;
  otherwise, it returns false."
  [year]
  (or
    (divide? year 400)
    (and (divide? year 4) (not (divide? year 100)))))
