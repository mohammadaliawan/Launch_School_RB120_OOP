# Open Ended Questions

# What is OOP and why is it important?

OOP is a programming paradigm that was created to solve the problems faced by programmers when dealing with large software systems. As software systems grew larger and more complex, it became very hard to maintain them. And the reason for this was that no clear boundaries existed between the different parts of a software program. One small change in one part of the program could effect several other parts without an obvious intention of doing so. It would also cause a cascading effect of errors throughout the entire program due to complex interdependencies throughout the program. This made making changes to programs a very difficult task which made maintenance tasks extremely difficult.  

OOP was created to help solve these problems. And it does so by structuring code in a way that makes it easier to maintain and even think about. OOP creates containers for data and functionality called objects and classes. Objects encapsulate(i.e. hide) the data and classes encapsulate functionality. Each object is independent of all other objects and changes to object does not effect other objects. And an object can only use the functionality that is provided by its own class. It cannot use any other functionality.

Hence OOP helps to provide protection and security for data. Another way OOP improves the maintenaility of programs is through polymorphism. Polymorphism is the ability of different types of data to respond to a common interface. Polymorphism allows us to write reusbale code which helps keep logic in one place which in turn helps with writing DRY code and maintenability.

OOP also creates a layer of abstraction for the programmer by the modeling the problem domain in a way where objects represent real world things. This helps the programmer to come up with new ways to solve the problem.

## What is encapsulation and how does it relate to the public interface of a class?

Encapsulation is a mechanism through which we can restrict access to data and functionality in a software program so that users of the data only have access to data and funtionality that they actually need. It creates boundaries within the program which helps to avoid unintentional manipulation of data. It provides protection and security for data. 

In Ruby it is implemented through the creation of objects. It hides the internal representation of objects and only exposes those attributes and behaviors of objects to the rest of the code base that is actually need by other objects to interact with this object.

We use method access control to expose these attributes and behaviors. Implementation details of a certain behavior are hidden using private and protected methods while only exposing that behaviour through the public methods that is actually need by the rest of the code base. These public methods comprise the public interface of the object. So while encapsulation hides the inner workings of the object, public interface exposes only those properties and methods that are required by users of the object to interact with it. 

Example:

```ruby
class Laptop
  def initialize(ram, storage)
    self.ram = ram
    self.storage = storage
  end

  def info
    "RAM: #{ram}, Storage: #{storage}"
  end

  def upgrade_ram(new_ram)
    self.ram = new_ram if new_ram.to_i <= 16 && new_ram.to_i > ram.to_i
  end

  private

  attr_accessor :ram, :storage
end

new_laptop = Latptop.new("4 GB", "150 GB")

p new_laptop.info
new_laptop.upgrade_ram("8 GB")
p newlaptop.info
```

# What are objects and classes and how do they relate to each other?

Classes are like a blueprint for objects. Objects are created from classes. They are instances of a class.
Classes define the attributes and behaviours of a particular object type. Attributes are the characteristics or properties of that make up an object and behaviours are the actions that an object can perform. 

Attributes defined in the class are tracked by the state of an object that is unique to that object. Instance variables are used to track the object's state. Behaviours are defined as instance methods in the class and are available to all objects of that class. So objects of a class have shared behaviour while having unique states. 

While classes encapsulate and expose behaviour in the form of instance methods, objects encapsulate state in the form of instance variables. Classes only define what instance variables an object of a class will have, while its the objects themselves that initialize these instance variables through instance methods.

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
``end

  def eat
    puts "I am eating..."
  end
end

bob = Person.new("Bob", "30 years")
```

## What is instantiation?

Instantiation is the workflow of creating object from classes. Objects are instances of a class and that is why creating objects from a class is called instantiation.

## What is polymorphism? Explain two different ways to implement polymorphism. How does polymorphism work in relation to the public interface?

Polymorphism is the ability of objects of different classes to respond to a common interface. By implementing polymorphism, objects of different types can invoke the same methods in the same way. The way they respond to these method invocations may vary from class to class depending on how the method is implemented in that class.

So the client code does not need to know how these methods are implemented as long as these objects are able to invoke these methods in the same way i.e. have the same kind and number of arguments and in the same order.

Polymorphism gives us the ability to write resuable code which improves maintainability of the code.

The public interface of objects comprises the public methods that the object has available and how these methods are called(with or without arguments). Polymorphism allows objects of different classes to respond to a common interface i.e they have shared interface. So the common public interface of objects of classes that implement polymorphsim, allows us to work with these objects in the same way. 

In other words, polymorphsim allows the sharing of public interface of objects. 

Polymorphism is implemented through two major ways:

1. Inheritance
2. Duck Typing

Inheritance is the sharing of behaviour among classes. It is a mechanism through which classes can inherit behavior from other classes or modules. It helps us to extract common behaviour among classes and move them to a superclass or module which helps with keeping logic in one place.

There are two ways to implement inheritance:
1. Class inheritance
2. Interface Inheritance

In class inheritance, a class inherits behaviour from another class. The class that inherits the behaviour is called the subclass and the class that it inherits from is called the superclass.
Class inheritance is used where there is an `is-a` relationship between objects. It is used to model heirarchical problem domains. 

For example:
```ruby
class Animal
  def eat
    puts "Eating..."
  end

  def run
    puts "Running..."
  end

  def sleep
    puts "Going to sleep..."
  end
end

class Dog < Animal
end

class Lion < Animal
end
```
2. Interface inheritance
Interfance inheritance is implemented through the use of modules. Modules are a group or collection of related behaviours i.e. instance methods. They contain shared behaviour similar to classes except you cannot instantiate objects from modules. Modules are used to extract common behaviour from classes and keep that behaviour in one place i.e. modules. Modules have to be included or mixed in classes for that class to inherit the behaviours defined in the module. They are mixed in to a class using the `include` method invocation and passing in the name of the module. The objects of that class can then invoke the instance methods defined in the module.

Interface inheritance is another way of implementing polymorphism. So objects of the classes that have that module mixed in are able to respond to a common interface provided by the module.

Modules are used where there is a `has-a` relationship between objects and a behaviour but that behaviour is needed by objects of different classes. We can include as many modules as needed in to a class.


```ruby
module Swimmable
  def swim
    puts "I am swimming..."
  end
end

class Animal
  def eat
    puts "I am eating..."
  end
end

class BullDog < Animal
  include Swimmable
end

class Fish < Animal
  include Swimmable
end

class Cat < Animal
end

dido = BullDog.new
nemo = Fish.new
puss = Cat.new

dido.swim # I am swimming...
nemo.swim # I am swimming...
puss.swim # NoMethodError
```

2. Duck Typing

Duck Typing is an informal way of classifying objects based on behaviour. Duck typing occurs when objects of different unrelated types are able to respond to the same method invocation. We dont care if an object belong to a class or type. All we care about is if an object has a certain behaviour. Duck typing focuses on what an object can do rather than what an object is.

```ruby
class EngineeringCompany
  attr_accessor :staff

  def initialize
    self.staff = [PipingEng.new, CivilEng.new, ElectricalEng.new]
  end

  def work_on_project
    staff.each do |worker|
      worker.execute_project
    end
  end
end

class PipingEng
  def execute_project
    piping_design
  end

  def piping_design
    # do something
  end
end

class CivilEng
  def execute_project
    civil_design
  end

  def civil_design
    # do something
  end
end

class ElectricalEng
  def execute_project
    elec_design
  end

  def elec_design
    # do something
  end
end

EngineeringCompany.new.work_on_project

```