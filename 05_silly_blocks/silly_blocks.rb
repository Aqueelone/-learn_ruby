def reverser
  c = yield
  result = ''
  c.to_s.split(' ').each do |word|
    result += word.to_s.reverse + ' '
  end
  result.rstrip
end

def adder(n = 1)
  yield + n
end

def repeater(n = 1)
  begin
    yield
    n -= 1
  end until n <= 0
end