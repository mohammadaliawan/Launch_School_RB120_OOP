class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

=begin
When a method is private, it can only be accessed by the current object i.e. it can only be
invoked on `self`. But in this example, we need to be able to access the getter method with
other objects of the same class as well. But at the same time, we want the method to not be accessible
outside the class. So we use the `protected` access modifier. This allows us to share data between
instances of the same class.
=end