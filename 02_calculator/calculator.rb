def add(a,b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum(a)
  result = 0
  a.each do |e|
    result += e 
  end
  result
end

def multiply(a)
  result = 1
  a.each do |e|
    result *= e
  end
  result
end

def power(a,b)
  a**b
end

def factorial(a)
  result = 1
  while a > 0 do
    result *= a
    a -= 1    
  end
  result
end
