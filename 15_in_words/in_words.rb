class Integer
  UNDER_TWENTY = {0=>'zero', 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five', 6=>'six', 7=>'seven',
                  8=>'eight', 9=>'nine', 10=>'ten', 11=>'eleven', 12=>'twelve', 13=>'thirteen', 14=>'fourteen',
                  15=>'fifteen', 16=>'sixteen', 17=>'seventeen', 18=>'eighteen', 19=>'nineteen', 20=>'twenty'}
  UNDER_HUNDRED = {10=>'ten', 20=>'twenty', 30=>'thirty', 30=>'thirty', 40=>'forty', 50=>'fifty',60=>'sixty',
                   70=>'seventy', 80=>'eighty', 90=>'ninety', 100=>'hundred'}
  DIVISIONS = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'google']

  def in_words
    num = self.to_i
    return UNDER_TWENTY[num] if num <= 20
    result = []
    grouped(num.num_to_a).each_with_index do |value, index|
      if (value[0] || value[1] || value[2]) && ( value[0] != 0 || value[1] != 0 || value[2] != 0)
        result.push(DIVISIONS[index]).push(under_thousand(value))
      end
    end
    result.reverse.join(" ").rstrip
  end

  def num_to_a
    self.to_s.reverse.split(//).collect! { |item|  item.to_i}
  end

  def grouped(array)
    result = []
    temp = []
    array.each do |item|
      temp.push(item)
      if temp.length == 3
        result.push(temp)
        temp = []
      end
    end
    result.push(temp) 
  end
  
  def under_thousand(array_num)
    result = []
    array_num[0] = 0 if !array_num[0]
    array_num[1] = 0 if !array_num[1]
    array_num[2] = 0 if !array_num[2]
    if array_num[0] + array_num[1] > 0
      if array_num[1]*10 + array_num[0] <= 20
        result.push(UNDER_TWENTY[array_num[1]*10 + array_num[0]])
      else 
        result.push(UNDER_TWENTY[array_num[0]]) if array_num[0] != 0 
        result.push(UNDER_HUNDRED[array_num[1]*10]) if array_num[1] !=0   
      end  
    end
    result.push(UNDER_HUNDRED[100]).push(UNDER_TWENTY[array_num[2]]) if array_num[2] != 0
    result.reverse.join(' ').rstrip
  end
end
