class Person
  #setter split into fullname and lastname
  #getter join fullname and lastname

  def name=(name)
    parts = name.split(" ")
    self.first_name = parts.first
    self.last_name = parts.last
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  attr_accessor :first_name, :last_name

end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

=begin
In the above code, a new object of the `Person` class is instantiated and assigned to the local variable `person1`. On line 6, a setter method `Person#name=` is being invoked and the string `"Jessica"
is being passed as an argument. So the `Person` class must define a setter method `name=`. On line `7`, `person1.name` is a getter method invocation. So the `Person` class must also define
a getter method `name`. In Ruby, to access an object's instance variables we need instance method. This instance methods is called a getter method if its simply returns the object referenced by
an instance variable. Setter methods are instance methods that reassign an instance variable to the provided argument.
To define both a getter and a setter, Ruby provides a method `attr_accessor` that takes a symbol as argument. `attr_accessor` creates both a setter and a getter method with a name specified by the 
argument. So on line 2, the `attr_accessor` method is invoked and the symbol `:name` is passed as an argument. This will create a getter method `name` and a setter method `name=`.

=end


