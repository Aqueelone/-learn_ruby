class Temperature
  class << self
    def from_celsius(cels)
      Temperature.new(:c => cels)
    end

    def from_fahrenheit(far)
      Temperature.new(:f => far)
    end
  end

  def initialize(temp)
    @c = temp[:c]
    @f = temp[:f]
  end

  def in_fahrenheit
    @c && @f = ((@c*90)/5 + 320).to_f/10
    @f
  end
  
  def in_celsius
    @f && @c = (@f-32)*5/9
    @c
  end
end

class Celsius < Temperature
  class << self
    def new(cels)
      Temperature.from_celsius(cels)
    end
  end
end

class Fahrenheit < Temperature
  class << self
    def new(far)
      Temperature.from_fahrenheit(far)
    end
  end
end