LITTLE = ['the', 'and', 'over']

def echo(a)
  a
end

def shout(a)
  a.upcase!
end

def repeat(a, n = 2)
  return ((a + " ")*n).rstrip
end

def start_of_word(a, n = 1)
  a[0,n]
end

def first_word(a)
  a.split(' ').first
end

def titleize(s)
  result = ''
  s.split(' ').each_with_index do |word, index|
    string = word.to_str    
    result += " " + string.capitalize if index == 0 || !(LITTLE.include? string)
    result += " " + string if index != 0 && (LITTLE.include? string)
  end
  result.lstrip
end