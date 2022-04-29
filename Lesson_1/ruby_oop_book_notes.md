# Object Oriented Programming With Ruby

## Object Oriented Programming

### Why Object Oriented Programming?
  - is a programming paradigm
  - created to deal with growing complexity of large software systems
  - increase in complexity and size lead to increased difficulty in maintenance.

### What is encapsulation?
 - Encapsulation is hiding pieces of functionality
 - Making that functionality unavailable to rest of the code base.
 - a form of data protection - so that data doesnt get manipulated without obvious intent
 - boundaries are defined by data encapsulation

### How does Ruby accomplish data encapsulation?
  - By creating objects and exposing interfaces i.e. methods to interact with those objects.

### What is another benefit of creating objects?
  - Allows the programmer to think on a new level of abstraction. Objects are represented as real world nouns and can be given methods that describe the behaviour that the programmer is trying to represent. 

### What is polymorphism?
  The ability of different types of data to respond to a common interface.
  poly -> many, morph -> forms

### What benefits does polymorphism provide?
  - Gives us the ability to use prewritten code for new purposes.

### What are the two different ways of applying polymorphic structure to Ruby programs?
  - Using Inheritance or Modules

### What is inheritance?
  - Where a class inherits behaviours of another class reffered to as the **superclass**.

### What is the difference between a superclass and subclass?
  - Superclasses are basic classes with large reusability containing common behaviours. Subclasses inherit behaviours from superclasses and define behaviours that are more fine grained and detailed.

### What are modules?
  Modules are similar to classes in that they contain shared behaviour. However, modules cannot be used to create objects.
  A module is a collection of behaviors that is usable in other classes via mixins.

### What is the purpose of Modules?
  A module allows us to group reusable code into one place. Modules are also used as a namespace.

### How are modules used with classes?
  Modules must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviours declared in that module are available to the class and its objects.

### What is an object?
  Anything that can be said to have a value is an object including classes and modules.

### How are objects formed? Give an analogy.
  Objects are created from classes. Classes can be considered to be molds and objects the things that are produced out of those molds

### What is the meaning of "instances of the same class"?
  Objects are instances of classes; meaning that objects are created from classes. 

### What is the meaning of "instantiated from a class"?
  Objects are created from classes.

### Where are the attributes and behaviours of objects defined?
  Ruby defines the attributes and behaviours of its objects in classes.

### What are classes?
  Classes are basic outlines of what objects should be made of and what they should be able to do.

### How do you define a class?
  ```ruby
  class CamelCase

  end
  ```
### How do you create an instance of a class?
  By using the class method `new`
  ```ruby
  sparky = GoodDog.new
  ```
  We created an instance of the `GoodDog` class and assigned it to the local variable `sparky`

### What is the workflow of creating a new object from a class called?
  Instantiation
  We have instantiated an object called sparky from the GoodDog Class.

### How are modules created and mixed in to a class?
  ```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!!")

bob = HumanBeing.new
bob.speak("Hello")
  ```

### What is the Method Lookup Path?
  Method Lookup Path is the path that ruby follows to find a method that has been called.

### How can we get the lookup path for the GoodDog Class?
  By using the class method `ancestors`.

### GoodDog Class Method Lookup path?
  ---GoodDog ancestors---
GoodDog  
Speak
Object
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject

## States and Behaviors

### When making classes what are the two things we usually focus on?
  States and Behaviours

### What are states and behaviours?
  States track attributes of individual objects, while Behaviours are what objects are capable of doing

### What is used to keep track of states of an object?
  Instance variables are used to track the states of objects

### What is the scope of instance variables?
  Instance variables are scoped at the instance or object level.

### What are instance methods?
  Instance method expose behaviours of objects of a class. They expose an interface to interact with objects of a class. They are available to all objects of that class.

**Instance variables keep track of state, and instance methods expose behavior for objects.**

## Intializing a new object

### Which method is called every time you create a new object?
  The `initialize` instance method is called everytime a new object is created using the `new` class method.

### What is a `constructor` method?
  The `intialize` method is a constructor method because it gets called everytime we create a new object.

## Instance variables

### What is an instance variable and what is it used for?
  Instance variable start with the `@` symbol and are used to track the states of an instance or object. It is one of the ways we tie data to objects.

### How long does an instance variable exist?
  An instance variable exists as long as the object instance exists.

### What is happening in the below code?
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```
The string "Sparky" is being passed to the `new` method through to the initialize method and is assigned to the local variable `name`. Within the `constructor` the initialize method we then assign the the instance variable `@name` to the object referenced by `name`.

### What are instance variables responsible for?
  Instance variables are responsible for keeping track of the state of an object. In the above example the name of the `sparky` object is the string "Sparky". This state of the object is tracked in the instance variable `@name`.
  We say that the `@name` instance variable for the `sparky` object references the string `Sparky`.

  If we created another `GoodDog` object for example with `fido = GoodDog.new("Fido")`, the `@name` instance variable for the `fido` object would contain the string `"Fido"`.

**Every Object's state is unique and instance variables is how we keep track of these states.**

**All objects of the same class have the same behaviors, though they contain different states**

**Instance variables can be referenced by instance methods inside the class, meaning we can expose information about the state of the object using instance methods.**

### What are getter methods?
  Getter methods are instance methods that return information about some state of an object.

### What are setter methods?
  Setter methods are instance methods that allow us to change information about some state of an object.

**Setter methods always return the value passed in as argument regardless of what happends inside the method**

### How does ruby create the getter and setter methods automatically?
  Using the `attr_accessor` method. It takes a symbol as argument which is used to create the methods names for getter and setter methods.
  `attr_accessor :name, :height, :weight`

  **getter methods only**
  `attr_reader`

  **setter methods only**
  `attr_writer`

### Can getter and setter methods be accessed within the class?
  Yes, they can be referenced from within the class. In fact, it is preffered to use these getter and setter methods instead of referencing the instance variables directly.

### What things does the attr_accessor method create?
  getter method, setter method and also one instance variable.

  So, `attr_accessor :name, :height, :weight`
  gives us six getter/setter methods and three instance variables @name, @height, @weight although right now they reference the `nil` object.


## Classes and Objects II

### What are class methods and how are they implemented?
  Class methods are methods that are called directly on the class itself without having to instantiate any objects.

  ```ruby
  def self.what_am_i
    "I am a GoodDog class!"
  end
```

### When are class methods used?
  Class methods are where we put functionality that does not pertain to individual objects.
  Objects contain state, and if we have a method that does not need to deal with states, then we can just use a class method. 

### What are class variables and what is difference between instance and class variables?
  Instance variables capture information related to specific instances of classes. Class variables capture information related to an entire class.
  Class variables can be accessed from within instance methods as well.

### What does the to_s method return by default?
  By default the to_s method returns the name of the object and an encoding of the object_id.

  **the to_s method is called automatically on the object when we use it with puts or when used with string interpolation**

### What does `self` represent when used within the class inside instance methods?
  From within the class, When an instance method uses `self`, it references the calling object.

### What does `self` represent when used within the class but outside an instance method?
  Using `self` inside a class but outside an instance method refers to the class itself.

## Inheritance


  Inheritance is when a class inherits behavior from another class. 
  The class that is inheriting is called the subclass and the class it inherits from is called the superclass.
  Inheritance is used as a way to extract common behaviours from classes that share that behavior and move it to a superclass. This lets us keep logic in one place.

### What is used to signify that a class inherits from another class?
  class GoodDog < Animal

### What is method overriding?
  When the same methods exist in the superclass and subclass, the method in the subclass shall be used. This is called method overridding.

### What is the `super` keyword used for?
  `super` is used within a method to call a method earlier in the method lookup path. When you call `super` within a method, it searches the method lookup path for a method of the same name then invokes it.

### What does the `super` keyword do in addition to invoking a method earlier in the lookup path?
  It also automatically passes the argument passed to the method in the subclass to the method in the superclass.

### How do you use `super` to send no arguments to the method in the superclass?
  `super()`

### What are the two types of inheritance called?
  Class inheritance where a class inherits the behaviours from another class. One type inherits the behaviours from another type.

  The other type of inheritance is called interface inheritance. The class doesnt inherit from another type. But instead inherits the interface provided by the mixin module.


### When to use class inheritance vs. interface inheritance?

  - you can only subclass from one class. But you can mixin as many modules as you like. 
  - If there is "is a/an" relationship, class inheritance is the correct choice
  - If there is "has a/an" relationship interface inheritance is generally a better choice.
  - You cannot instantiate modules. Modules are only used for namespacing and grouping common methods.

### What is the Method Lookup Path?
  Method Lookup path is the order in which classes are inspected when you call a method.

### Modules and Class inheritance togather
  Instances of a class have access to methods defined in any included modules in the superclass.

### What is namespacing?
  namespacing means organizing similar classes under a module. 

### What are the advantages of using modules for namespacing?
  - It becomes easy to recognize related classes
  - It reduces the likelihood of our classes colliding wit other similarly names classes.

### What are the three use cases for modules?
  - mixin common behaviour into classes
  - namespacing: grouping related classes in a module
  - container for out of place methods called module methods

### How are module methods defined and called?
```ruby
  module Mammal
  def self.some_method
    #some code
  end
end

value = Mammal.some_method #OR
value = Mammal::some_method
```

They are called directly from the module:
`value = Mammal.some_method`

### What is Method Access Controi?
  Restricting access to methods by using access modifiers.

### What are the three access modifiers used in Ruby?
  public, private, protected.

### What is a public method?
  Public method is a method that is available to anyone who knows either the class name or the object's name. These methods are readily available for the rest of the program to use and comprise the class's interface i.e how other classes and objects will interact with this class and its objects.

### What are private methods?
  Methods that are doing some work in the class but dont need to be available to the rest of the program. `private` methods are only accessible from other methods in the class.
  Private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called without self.

### What are protected methods?
  Protected methods are similar to private methods in that they cannot be invoked outside the class.
  The main difference is that protected methods allow access between class instances while protected methods donot