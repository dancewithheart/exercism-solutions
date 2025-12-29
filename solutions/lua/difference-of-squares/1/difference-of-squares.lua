local function square_of_sum(n)
    res = 0
    for i = 1, n do
        res = res + i
    end
    return res * res
end

local function sum_of_squares(n)
    res = 0
    for i = 1, n do
        res = res + (i * i)
    end
    return res
end

local function difference_of_squares(n)
    return square_of_sum(n) - sum_of_squares(n)
end

return { square_of_sum = square_of_sum, sum_of_squares = sum_of_squares, difference_of_squares = difference_of_squares }
