def is_armstrong_number(number):
    num_as_str = str(number)
    length = len(num_as_str)
    digitsToPowerLen = [int(digit)**length for digit in num_as_str]
    return sum(digitsToPowerLen) == number

