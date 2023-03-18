# Practice Problems

## Object Oriented Programming

### What is Object Oriented Programming and why is it important?

Object Oriented Programming is a programming paradigm. It is a way of structuring and organizing code to make it more maintainable, flexible and easier to think about. 

It was created to deal with the increasing complexity of software programs. As software systems grew larger and more complex it became very difficult to maintain them and make changes. 

OOP solves these problems by creating containers for data and functionality called objects which form the building blocks for the entire program.

These building blocks are independent of each other. Manipulating one object does not affect other objects.The entire program becomes the interaction of these objects. It is even possible to reuse these objects for other purposes which reduces repetition within the program.

OOP gives us the ability write organized code with clear boundaries. Its gives us the ability to section off areas of code, restricting access to data providing data protection and security.

It also creates another layer of abstraction for the programmer to think on which helps with comming up with a more flexibles solution. 

-----------------------------------------------------------------------------------------------------------------

Object Oriented Programming is a programming paradigm. It is a way of structuring and organizing code to make it more maintainable, flexible and easier to think about. 

OOP creates containers for data and functionality called objects which form the building blocks for the entire program.

These building blocks are independent of each other. Manipulating one object does not affect other objects.The entire program becomes the interaction of these objects. It is even possible to reuse these objects for other purposes which reduces repetition within the program.

OOP gives us the ability to write organized code with clear boundaries. It gives us the ability to section off areas of code, restricting access to data providing data protection and security.

It also creates another layer of abstraction for the programmer to think on which helps with comming up with a more flexible solution. 

## Encapsulation

### What is encapsulation? How does Ruby implement it? Why is it used?

In general terms, encapsulation is the hiding of or restricting access to some data and functionality in a program.

Ruby implements encapsulation by creating objects that have some hidden attributes and behaviours and exposing only those attributes and behaviours through the object's public interface that users of the object need to interact with this object.

Encapsulation helps with data protection so that data cannot be manipulated without explicit intention. It also helps to define boundaries within our program and introduces a new layer of abstraction in a program in the way that the implementation details of a class and its associated behaviours are abstracted away from the programmer.

**Example**

```ruby
class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  private

  attr_accessor :author, :title
end

book1 = Book.new("J.K. Rowling", "Harry Potter")
book2 = Book.new("Tolkien", "The Hobbit")
```
In the above example. the objects `book1` and `book2` are both objects of class `Book` and each of them have the attributes author and title. These attributes are tracked by the state of each object. These states for each object are unique and independent of each other. This state for each object is tracked by the instance variables `@author` and `@title`. Both `book1` and `book2` have their own copy of these instance variables. With the above code, it is not possible to access the state of these `book1` and `book2` objects outside the object i.e. it is not possible to access the instance variables `@author` and `@title` because The getter and setter methods for these instance variables are private methods. Hence, the state of each of these objects is encapsulated within the object with no way to access it outside the object. 

Furthoremore, it is not possible for `book1` object to access `book2` object's instance variables. So, again we can see that there are clear boundaries within our program. This is encapsulation.

However, we can define public methods (`show_author` and `show_title`) that can be used to expose these attributes to rest of the program but in a controlled way so that data is protected from unintentional manipulation. These methods return a copy of the values for `@author` and `@title`. These implementation details are hidden within the class. 

We can also define public methods that can change the attributes of these objects. Below, we have defined the `change_author` and `change_title` methods. These methods use the private methods `author=` and `title=` to change the values assigned to these instance variables. However, this is still done in a controlled way by first capitalizing the input and then assigning it to the instance variables. These implementation details are hidden within the class.

By keeping the getter and setter methods private and only exposing certain methods that control the way the state of each object is accessed, we are using encapsulation to restrict access to data and functionality from the rest of the program hence protecting data from unitentional manipulation and providing a layer of abstraction between the public interface and implementaition details.

```ruby
class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  def show_author
    author.clone
  end

  def show_title
    title.clone
  end

  def change_author(new_author)
    self.author = new_author.capitalize
  end

  def change_title(new_title)
  self.title = new_title.capitalize
  end

  private

  attr_accessor :author, :title
end

book1 = Book.new("J.K. Rowling", "Harry Potter")
book2 = Book.new("Tolkien", "The Hobbit")

book1.author # J.K. Rowling
book2.author # Tolkien

book1.title # Harry Potter
book2.title # The Hobbit
```

### How does encapsulation relate to the public interface of a class?

The methods and properties which are encapsulated within an object are exposed to the outside through the public interface of a class i.e. its public methods. The public interface of a class defines how we interact with the data encapsulated within an object.

Encapsulation hides the internal represenation i.e. the state of objects and certain implementation details of behaviours of an object from the outside. The public interface i.e. the public methods are used to expose only those behaviours and attributes in a controlled way that users of the objects need to interact with this object.

## Classes and Objects

### What is object?

An object is an instance of a class. Objects are created from classes. If classes are considered as the blueprints then objects can be considered as the things that are made in accordance with those blueprints. In Ruby, objects are anything that have a value e.g. strings, arrays, hashes etc.

### What is a class?

A class is like a blueprint for objects. They are basic outlines of what an object should be made of i.e. attributes and what it should be able to do i.e. behaviours. So classes define the attributes and behaviours of its objects. 

### What is instantiation?

Instantiation is the workflow of creating objects from classes.

## Polymorphism

### What is polymorphism?

Polymorphism is the ability of different types of objects to respond to the same method invocation.

### Explain two different ways to implement polymorphism?

Polymorphism can be implemented in two major ways:

1. Inheritance
2. Duck Typing

**Polymorphism through Inheritance**

Inheritance is a mechanism through which a class can inherit behaviour from another class or module. 

So when two or more different classes either subclass from a common superclass or have a common mixin module, then objects of all those different classes will be able to invoke the same methods because those methods have been aquired by those different classes through inheritance either from the superclass or a mixin module. So any client code that is using objects of these various classes does not need to care about what type of object is invoking a method. All it needs to know is that those object types have that behaviour. This is polymorphism through inheritance.

Furthermore, the subclasses may provide their own implementations of that behaviour by overriding the behaviours inherited from the superclass. In this case as well, the different object types will be able to respond to the same method invocation but the implementation details may be different. This is also polymorphism.

Below is an example of polymorphism through Inheritance:

```ruby
class Engineer
  def design
    puts "I am designing."
  end
end

class ProjectEngineer < Engineer
end

class CivilEngineer < Engineer
  def design
    puts "Designing the foundations"
  end
end

class StructuralEngineer < Engineer
  def design
    puts "Designing the structure"
  end
end

engineer1 = CivilEngineer.new
engineer2 = StructuralEngineer.new
engineer3 = ProjectEngineer.new

engineers = [engineer1, engineer2, engineer3]

engineers.each do |engineer|
  engineer.design
end
```

In the above code, we have three classes `ProjectEngineer`, `CivilEngineer` and `StructuralEngineer` that subclass from a common superclass `Engineer`. The `design` instance method defined in the superclass `Engineer` is inherited by all three subclasses. But both `CivilEngineer` and `StructuralEngineer`  override this behaviour with their own implementations. While the subclass `ProjectEngineer` aquires this behaviour from its superclass `Engineer`.

We have also created three objects from each of those classes on lines 162 to 164 and we have stored them in an array referenced by the local variable `engineer`.

On lines 168 to 170, the client code i.e. the `each` method with the passed in block does not care about what type of object is being passed into the block as long as this object has the behaviour or instance method `design`. All three objects that are passed into the block are able to respond to the same method invocation `design`. This is an example of polymorphism through inheritance.

**Polymorphism through Duck Typing**

Duck Typing is an informal way of categorizing different object types based on a common behaviour that all those object types have. It occurs when objects of different unrelated types are able to respond to the same method invocation.

Below is an example of polymorphism through duck typing:

```ruby
class Project
  attr_accessor :drawings, :schedule, :staff

  def initialize
    self.staff = [DesignEngineer.new, ProjectManager.new]
  end

  def start
    staff.each do |person|
      person.execute_project(self)
    end
  end
end

class ProjectManager
  def execute_project(project)
    develop_milestones(project.schedule)
  end

  def develop_milestones(schedule)
    puts "Developing Milstones"
  end
end

class DesignEngineer
  def execute_project(project)
    develop_design(project.drawings)
  end

  def develop_design(drawings)
    puts "Designing the Equipment"
  end
end

Project.new.start
```
In the above code, we have a class `Project` that has the attributes `drawings`, `schedule` and `staff`. And we have also defined two other class which are unrelated to `Project` i.e. `ProjectManager` and `DesignEngineer`. 

Polymorphism through duck typing is implemented in the `Project#start` method. We are invoking the `each` method on the array referenced by `@staff`. So, the `DesignEngineer` and `ProjectManager` objects are being passed into the block and the `execute_project` method is being invoked on each of these objects and the `Project` object being passed in as argument.

Here the client code does not need to know the what type of object is calling the `execute_project` method. All it needs to know is that these objects have this method and that it takes a `Project` object as an argument.

The respective classes i.e. `DesignEngineer` and `ProjectManager` then take care of the implementation details of these methods. And as we can see they are completely different. The `DesignEngineer#execute_project` method invokes the `DesignEngineer#develop_design` method while the `ProjectManager#execute_project` method invokes the `ProjectManager#develop_milestones` method.

Hence we have informally categorized these different object types. Both `DesignEngineer` and `ProjectManager` type objects belong to the category that can `execute_project`. This is an example of polymorphism through duck typing.

### How does polymorphism work in relation to the public interface?

The public interface of a class comprises of the public methods defined in a class. Whenever we implement polymorphism for some related or unrelated classes either through inheritance or duck typing, it is the public interface i.e. the public methods defined in these classes, that lets us work with the objects of these classes in the same way i.e invoke the same methods on different object types.

### What is duck typing? How does it relate to polymorphism - what problem does it solve?

Duck Typing is a way of implementing polymorphism in Ruby for different types of unrelated classes. When we have multiple different classes that are not related either through class inheritance or interface inheritance but do have some common behaviour, we can design the public interface for these different classes in a way that allows us to work with these different types in the same way. This allows us to write code that is easier to maintatain and also adds flexibility so that future changes or additions are easier to integrate.

## Inheritance

### What is inheritance?

Inheritance is a mechanism through which a class can aquire behaviours/methods defined in another class or module.

There are two ways to implement inheritance in Ruby:
1. Class Inheritance
2. Interface Inheritance

**Class Inheritance:**

Class inheritance is When a class inherits behaviour or subclasses from another class. The class that inherits behaviour is known as the subclass and the class that it inherits from is known as the superclass. 

Class inheritance allows us to define basic class that have the ability to be reused in multiple scenarios by defining subclasses of that class. These subclass can either extend the basic behaviour defined in the superclass or completely override that behaviour with its more specific detailed implementation.

Below is an example of class inheritance:

```ruby
class Engineer
  def design
    puts "I am designing."
  end
end

class ProjectEngineer < Engineer
end

class CivilEngineer < Engineer
  def design
    puts "Designing the foundations"
  end
end

class StructuralEngineer < Engineer
  def design
    puts "Designing the structure"
  end
end

engineer1 = CivilEngineer.new
engineer2 = StructuralEngineer.new
engineer3 = ProjectEngineer.new

engineer1.design #  Outputs: Designing the foundations

engineer2.design #  Outputs: Designing the structure

engineer3.design #  Outputs: I am designing.
```

In the above code, we have three classes `ProjectEngineer`, `CivilEngineer` and `StructuralEngineer` that subclass from a common superclass `Engineer`. The `design` instance method defined in the superclass `Engineer` is inherited by all three subclasses. But both `CivilEngineer` and `StructuralEngineer`  override this behaviour with their own implementations. While the subclass `ProjectEngineer` aquires this behaviour from its superclass `Engineer`.

We have also created three objects from each of those classes on lines 162 to 164. On lines XX, XX and XX we are invoking the same method `design` on all three objects even though they are of different types. This is because, class inheritance allows subclasses to aquire behaviour/methods from their superclasses.

**Interface Inheritance:**

Interface inheritance is achieved through the use of modules. Modules are a collection of related behaviours/methods that can be 'mixed' or 'included' into multiple classes. The classes and its objects then aquire the behaviours defined in the module. This is called as interface inheritance.

Public methods define the interface of a class i.e the way other classes and objects interact with this class and its object. So including or mixing in a module into a class essentially allows the class to inherit the interface provided by the module i.e the instance methods defined in the module.

```ruby
module Speakable
  def speak(words)
    puts words
  end
end

class GoodDog
  include Speakable
end

class HumanBeing
  include Speakable
end

sparky = GoodDog.new
sparky.speak("Arff!!") # Outputs: Arff!!
bob = HumanBeing.new
bob.speak("Hello") # Outputs: Hello
```
In the above example, we have defined two classes `GoodDog` and `HumanBeing`. Both classes the module `Speakable` mixin. The `Speakable` module defines an instance method `speak`. On lines XX and XX we have created objects of `GoodDog` and `HumanBeing`. And on lines XX and XX we are invoking the method `speak` on both of them. As we can see both objects can invoke the same method `speak` because both classes inherit this behaviour from the module `Speakable`.

### What is the difference between a superclass and a subclass?

Superclass is the class that another class inherits behaviour from while the class that inherits is known as the subclass.

Superclasses are defined as general classes that have multiple use cases. So the attributes and behaviours defined in superclasses are generic and could be applicable in multiple scenarios.

On the other hand, subclasses are defined for a more specific use case where the attributes and behaviours are detailed and fine tuned to that specific scenario. Subclasses can either extend the behaviours defined in their superclasses or completely override that behaviour with their own implementation.

Example:

```ruby
class Engineer
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def design
    puts "I am designing"
  end
end

class StructuralEngineer < Engineer
  attr_reader :department

  def initialize(name, grade, department = "Onshore")
    super(name, grade)
    @department = department
  end

  def design
    puts "I am designing #{@department} structures"
  end
end
```

Above, we have defined a superclass `Engineer`. This class has been defined as a generic engineer class. All types of engineers will have name and grade attributes and all of them will be able to perform some form of designing. Hence, we have defined the class to have `@name` and `@grade` instance variables and also have a generic `design` instance method.

We have also defined a `StrucuturalEngineer` class. This class has a more specific use case. Structural engineers will belong to a specific department and will design offshore or onshore structures. Hence, we have defined the class to have an additional instance variable `@department` that defaults to `"Onshore"`. We have also defined the `design` method that perform the designing of some type of structure.

### When is it good to use class inheritance vs. Interface inheritance?

Class inheritance is used to model naturally heirachical relationships between various object types. That is, where there is an 'is a' relationship between various object types. For example, a dog 'is a' pet, a cat 'is a' pet. In cases like these, the `Dog` and `Cat` classes would subclass from `Pet` class. 

Interface inheritance is used model a 'has an ability' relationship between multiple object types and a behaviour that they have in common. For example, dog 'has an ability' to swim, fish 'has an ability' to swim. In cases like these, the swim behaviour would be defined as a behaviour in a module. And the classes `Dog` and `Fish` would mixin this module i.e. inherit this behaviour from the `Swimmable` module.

## Modules

### What is a module? What is a mixin?

Modules are a collection or set of related behaviours. Just like classes, they are used to club togather behaviours that are shared by multiple classes but unlike classes it is not possible to instantiate objects from modules.

Modules are mixed into or included in classes using the `include` method invocation. The class and its objects then aquire the behaviours defined in the module. This is called a mixin. 

### In inheritance, when would it be good to override a method?