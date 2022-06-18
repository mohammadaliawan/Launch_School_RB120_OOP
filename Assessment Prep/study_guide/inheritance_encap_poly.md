# Class Inheritance, Encapsulation and Polymorphism

- Also cover Method lookup path

## Encapsulation

Encapsulation is hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention. It is what defines the boundaries in your application and allows your code to achieve new levels of complexity. Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.

Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. We can use method access control to expose these properties and methods through the public (or external) interface of a class: its public methods.

### My definition

Encapsulation in object oriented programming is about restricting access to data and functionality so that users of the data only have access to the data and functionality that they actually need.

Encapsulation in Ruby is implemented through the creation of objects and exposing only those behaviours and attributes of the object through public methods that are actually needed by other objects to interact with that object. 

Encapsulation helps with data protection, reduces dependencies within the program and also makes the software program easier to maintain. 

### Example

```ruby

class Computer
  def initialize(type, model, ram)
    self.type = type
    self.model = model
    self.ram = ram
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

p home_computer.ram

```

In the above example, the `Computer` object referenced by `home_computer` has three attributes `type`, `model` and `ram`. These attributes are tracked by the state of the object which comprises of the instance variables `@type`, `@model`, `@ram` and their values.

Now, it is possible to only read the state of this object through the use of the public method `Computer#info`. It is not possible to modify the state of this object i.e. manipulate the values for these instance variables. Although we can upgrade the RAM for the `home_computer` object by using the public method `Computer#upgrade_ram` but that access is also restricted as this attribute cannot be changed to any value. It can only be changed to `"8 GB"`. 

So by creating a `Computer` object and exposing only certain interfaces that can only do certain actions on the object we have protected the data associated with our `home_computer` object. This is an example of encapsulation in OOP.