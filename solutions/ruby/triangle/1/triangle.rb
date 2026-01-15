class Triangle
  def initialize(arr)
    @a = arr[0]
    @b = arr[1]
    @c = arr[2]
  end
  
  def equilateral?
    triangle? && (@a == @b) && (@a == @c)
  end

  def triangle?
    (@a > 0) & (@b > 0) & (@c > 0) & (@a + @b > @c) & (@b + @c > @a) & (@a + @c > @b)
  end

  def isosceles?
    triangle? & ((@a == @b) | (@a == @c) | (@b == @c))
  end

  def scalene?
    triangle? & (not isosceles?)
  end  
end