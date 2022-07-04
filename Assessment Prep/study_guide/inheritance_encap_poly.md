# Class Inheritance, Encapsulation and Polymorphism

- Also cover Method lookup path

## Encapsulation

Encapsulation is hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention. It is what defines the boundaries in your application and allows your code to achieve new levels of complexity. Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.

Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. We can use method access control to expose these properties and methods through the public (or external) interface of a class: its public methods.

### My definition

Encapsulation in object oriented programming is about restricting access to data and functionality so that users of the data only have access to the data and functionality that they actually need and so that there is no unitentional manipulation of data.

Encapsulation in Ruby is implemented through the creation of objects and exposing only those behaviours and attributes of the object through public methods that are actually needed by other objects to interact with that object. 

Encapsulation helps with data protection, reduces dependencies within the program and also makes the software program easier to maintain. 

### Example

```ruby
module Upgradable
  def upgrade_ram
  end

  def upgrade_storage
  end
end

class Laptop
  include Upgradable
end

class Desktop
  include Upgradable
end

class Computer
  def initialize(type, model, ram, storage)
    self.type = type
    self.model = model
    self.ram = ram
    self.storage = storage
  end

  def info
    "#{type}, #{model}, #{ram}"
  end

  def upgrade_ram
    self.ram = "8 GB"
  end

  private

  attr_accessor :type, :model, :ram
end

home_computer = Computer.new("laptop", "Dell Latitude", "4 GB")

p home_computer.info

home_computer.upgrade_ram

p home_computer.info

```

In the above example, the `Computer` object referenced by `home_computer` has three attributes `type`, `model` and `ram`. These attributes are tracked by the state of the object which comprises of the instance variables `@type`, `@model`, `@ram` and their values.

Now, it is possible to only read the state of this object through the use of the public instance method `Computer#info`. It is not possible to modify the state of this object i.e. manipulate the values for these instance variables. Although we can upgrade the RAM for the `home_computer` object by using the public instance method `Computer#upgrade_ram` but that access is also restricted as this attribute cannot be changed to any value. It can only be changed to `"8 GB"`. 

So by creating a `Computer` object and exposing only certain interfaces that can only do certain actions on the object we have protected the data associated with our `home_computer` object. This is an example of encapsulation in Ruby.

## Polymorphism

Polymorphism is the ability for different types of data to respond to a common interface. That is, it lets objects of different types respond to the same method invocation.

When two or more object types have a method with the same name, we can invoke that method with any of those objects. 

Polymorphism is implemented in two major ways:

1. Inheritance

- Class Inheritance:

Class Inheritance is when a class inherits behavior from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

Super classes can be defined as basic classes with large reusability and smaller subclasses are defined for more fine-grained, detailed behaviors.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This lets us keep logic in one place. 

- Method Overriding
Method overriding occurs when we have a method in a subclass that has the same name as a method in it's superclass. When the method is invoked, Ruby first looks for that method in the subclass. And as it finds a method with that name, it executes that method. It does not go looking further up the method look up path in the superclass. This is called method overriding. The method in the superclass was overridden by the method defined in the subclass. 

See example in computer.rb

- `super`

The `super` keyword is used to call a method of the same name earlier in the method lookup path. 

See example in computer.rb

- Interface Inheritance

Another way to apply polymorphic structure to Ruby programs is to use a Module. Modules are similar to classes in that they contain shared behavior. However, you cannot create an object with a module. A module must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

2. Duck Typing

