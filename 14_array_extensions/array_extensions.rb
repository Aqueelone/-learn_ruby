class Array
  def sum
    sum = 0
    self.each do |num|
      sum += num
    end
    sum
  end

  def square
    sq = []
    self.each { |item| sq.push(item * item) }
    sq
  end

  def square!
    self.collect! { |i| i*i }
  end
end
