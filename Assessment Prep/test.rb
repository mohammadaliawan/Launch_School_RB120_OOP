class Person
  @@greeting = "Hello"

  def self.greet
    @@greeting
  end
end

class Student < Person
  def change_greeting
    @@greeting = "Goodbye"
  end
end

bob = Student.new
p Person.greet
bob.change_greeting
p Person.greet
