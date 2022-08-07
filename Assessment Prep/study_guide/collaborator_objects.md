# Collaborator Objects

Objects that are stored as state within another object are called collaborator objects. They are called collaborators because they work in collaboration with the class they are associated with.

Another definition: An object that is assigned to an instance variable in another object.

As state is tracked by(or stored in) instance variables, we can assign instance variables to reference any type of object. These objects are known as collaborator objects.

Collaborator objects have an important role in object oriented design as they represent the connections between various parts in a program so it is important to consider what collaborators a class has and if those associations make sense both technically and in terms of modeling the problem.



```ruby
class Computer
end

class Person
  attr_accessor :computer

  def initialize(name, computer)
    @name = name
    @computer = computer
  end
end

computer1 = Computer.new

jack = Person.new("Jack", computer1)
puts jack.computer #=> #<Computer:0x0000015fb647a420>
```

In the above example we have defined two classes `Computer` and `Person`. And we have instantiated an object `computer1` of the `Computer` class and object `jack`  of the `Person` class. 

During instantiation of the `jack` object on line `20`, we have passed the `computer1` object as an argument to the `new` method which is then passed to the `initialize` instance method by the `new` method and assigned to the `computer` method parameter.

The `initialize` method initializes the instance variable `@computer` to the object referenced by the method parameter `computer`.

So now our `Person` objects are using `Computer` objects to track their states. And so `Computer` objects are called Collaborator Objects in this case.





