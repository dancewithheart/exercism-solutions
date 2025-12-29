local leap_year = function(year)
  return year % 400 == 0 or (not (year % 100 == 0) and year % 4 == 0);
end

return leap_year
