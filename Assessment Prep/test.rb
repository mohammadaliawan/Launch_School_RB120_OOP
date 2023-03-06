class Cat
  attr_accessor :type

  # def age
  #   @age
  # end

  def age=(age)
    @age += age
  end

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age+=(1)
  end
end

puss = Cat.new("Sphinx Cat")
puss.make_one_year_older

p puss