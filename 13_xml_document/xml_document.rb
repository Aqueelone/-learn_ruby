class XmlDocument
  def initialize(formats = false) 
    @xml = ''
    @attr =''
    @formats = formats
    @form_include_after = formats ? "\n" : ''
  end

  def send(tag_name)
    "<#{tag_name}/>"
  end

  def method_missing(name, hash = {})
    @xml = yield if block_given?
    hash.each_pair do |key, value|
      @attr = " #{key}='#{value}'"
    end
    if @xml.empty?
      @xml = "<#{name}#{@attr}/>#{@form_include_after}" 
    else
      @formats && @xml = @xml.gsub('<', '  <')
      @xml = "<#{name}#{@attr}>#{@form_include_after}#{@xml}</#{name}>#{@form_include_after}"
    end
    @attr = ''
    @xml
  end
end
