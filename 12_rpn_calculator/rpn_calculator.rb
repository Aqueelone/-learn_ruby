class RPNCalculator
  def initialize
    @stream = []
  end

  def value
    @stream.last
  end

  def tokens(string)
    result = []
    string.split.each do |item|
      item = item.gsub(/(\+|\-|\*|\/)/) { ':' + $1}
      if item.match(':')
        result.push(eval(item))
      else
        begin
          result.push(item.to_i)
        rescue
          begin
            result.push(item.to_i)
          rescue
            result.push(item.to_s)
          end
        end
      end      
    end
    result
  end

  def push(volume)
    @stream.push(volume)
  end

  def +
    self.+
  end

  def -
    self.-
  end

  def *
    self.*
  end

  def /
    self./
  end

  def plus
    @stream.push(":+")
    calculate
  end

  def minus
    @stream.push(":-")
    calculate
  end

  def times
    @stream.push(":*")
    calculate
  end

  def divide
    @stream.push(":/")
    calculate
  end

  def evaluate(string)    
    tokens(string).each do |item|
      @stream.push(item)
      calculate if !item.is_a?(Numeric)
    end    
    value
  end

  def calculate
    validate
    a = @stream.last(3)[0]
    b = @stream.last(3)[1]
    command = @stream.last(3)[2].to_s
    command = ":" + command if !command.match(":")
    result = eval("#{b}#{command.sub(":", "")}#{a}") if [":+", ":-", ":*"].include?(command)
    result = b / a.to_f if command == ":/"
    raise 'not support operation yet!' if !result
    @stream.pop(3)
    @stream.push(result)
  end

  def validate
    @test = @stream.last(3)
    if @test.length < 3 || @test[0].to_s.sub(".", "").match(/\D/) ||
        @test[1].to_s.sub(".", "").match(/\D/) || !@test[2].to_s.match(/(\+|\-|\*|\/)/)
      raise 'calculator is empty'
    end
  end

  def clear
    @stream.clear
  end
end
