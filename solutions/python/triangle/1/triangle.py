def equilateral(sides):
    return valid_triangle(sides) and (sides[0] == sides[1] == sides[2])


def isosceles(sides):
    a = sides[0]
    b = sides[1]
    c = sides[2] 
    return valid_triangle(sides) and ((a == b) or (b == c) or (a == c))


def scalene(sides):
    a = sides[0]
    b = sides[1]
    c = sides[2]
    return valid_triangle(sides) and (a != b) and (b != c) and (a != c)

def valid_triangle(sides):
    a = sides[0]
    b = sides[1]
    c = sides[2]
    return (a + b > c) and (a + c > b) and (b + c > a)
