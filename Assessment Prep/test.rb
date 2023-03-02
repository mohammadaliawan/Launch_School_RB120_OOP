class Person
  @@greeting = "Hello"

  def self.greet
    @@greeting
  end

  def greet
    @@greeting
  end

  def add_to_greeting
    @@greeting += " World"
  end
end

bob = Person.new
joe = Person.new

p Person.greet
p bob.greet
p joe.greet
bob.add_to_greeting
joe.add_to_greeting
p Person.greet