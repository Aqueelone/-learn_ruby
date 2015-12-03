class Book
  def initialize
    @title = nil
  end
  
  def title=(title) 
    @title = titleize(title)
  end
  
  def title
    @title
  end
  
  private
  
  def titleize(title)
    little = ['a', 'an','the', 'and', 'over', 'in', 'of']
    result = ''
    title.split(' ').each_with_index do |word, index|
      string = word.to_str
      if index != 0
        if little.include? string
          result += ' ' + string
        else
          result += ' ' + string.capitalize
        end
      else
        result += string.capitalize
      end
    end
    result
  end
end