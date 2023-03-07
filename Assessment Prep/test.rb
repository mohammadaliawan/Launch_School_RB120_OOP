class KrispyKreme
  def initialize(filling_type, glazing)
    self.filling_type = filling_type
    self.glazing = glazing
  end

  def filling_type=(filling_type)
    unless filling_type
      @filling_type = "Plain"
    else
      @filling_type = filling_type
    end
  end

  def glazing=(glazing)
    unless glazing
      @glazing = ''
    else
      @glazing = glazing
    end
  end

  def to_s
    if @glazing.empty?
      @filling_type
    else
      "#{@filling_type} with #{@glazing}"
    end
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"