CONSONANT = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "r", "s", "t", "v", "w", "x", "z"]

def translate(s)
  result = ''
  s.split(' ').each do |word|
    result += translate_word(word) + ' '
  end
  result.rstrip
end

def translate_word(word)
  result = ''
  ended = ''
  used = false
  qu_detection = false
  word.each_char do |symbol|
    if used
      result += symbol
    else
      if symbol == 'q'
        ended += symbol
        qu_detection = true
      else
        if qu_detection && symbol == 'u'
          ended += symbol
          qu_detection = false
        else
          if !CONSONANT.include? symbol
            result += symbol 
            used = true
          else
            ended += symbol
          end 
        end
      end
    end
  end
  result + ended + 'ay'
end