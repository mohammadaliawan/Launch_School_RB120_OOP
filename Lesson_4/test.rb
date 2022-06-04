class Cat
  attr_accessor :age

  def initialize(age)
    @age = age
  end

  def one_year_older
    age = age() + 1
  end
end

catty = Cat.new(10)

catty.one_year_older

p catty.age