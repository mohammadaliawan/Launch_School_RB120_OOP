class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def older?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

bob = Person.new("Bob", 20)
tom = Person.new("Tom", 30)

p bob.older?(tom)