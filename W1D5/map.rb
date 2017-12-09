class Map

  attr_reader :list

  def initialize
    @list = []
  end

  def assign(key, value)
    @list << [key,value] unless lookup(key) != nil
  end

  def lookup(key)
    @list.each do |el|
      return el[1] if el[0] == key
    end
    nil
  end

  def remove(key)
    val = lookup(key)
    @list.each_index do |i|
      @list.slice!(i,0) if @list[i] == [key,val]
    end
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup
    new_array = []
    @list.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end


end
