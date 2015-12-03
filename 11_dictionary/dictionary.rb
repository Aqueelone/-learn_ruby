class Dictionary
  def initialize
    @entries = {}
  end

  def new
    @entries
  end

  def add(entry)
    @entries.store(entry, nil) if entry.is_a?(String)
    @entries.update(entry) if entry.is_a?(Hash)
  end

  def entries
    @entries
  end

  def keywords
    @entries.keys
  end

  def keywords_a
    @entries.keys.sort 
  end

  def include? (word)
    @entries.has_key?(word)
  end

  def find(pattern)
    result = Hash.new
    @entries.each_key do |key| 
      key.match(pattern) && result.store(key, @entries[key])
    end
    result
  end

  def printable
    result = ''
    notfirst = false
    @entries.keys.sort.each do |key|  
      notfirst && result += "\n"
      result +="[#{key}] #{'"' + @entries[key] + '"'}"
      notfirst = true
    end
    result
  end
end