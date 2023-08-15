def add(number1, number2)
  number1 + number2
end

def subtract(number1, number2)
  number1 - number2
end

def sum(arr)
  result = 0

  arr.map do |one|
    result += one
  end

  result
end

def multiply(arr)
  result = 0

  arr.map do |one|
    result *= one
  end

  result
end

def power(number, power)
  return number if power == 1

  power -= 1
  result = number

  power.times do
    result *= number
  end

  result
end

def factorial(num)
  result = num
  return 1 if num.zero?

  num.times do
    num -= 1
    return result if num.zero?

    result *= num
  end

  result
end

