# Practice Test 1 Awnsers

## Classes and Objects

__Q: What is a class? What is an object? What relationship do they have? Explain with an example?__

Classes are basic outlines or a blueprint for objects. They define the attributes for objects i.e what characteristics an object will have. They also define what that object will be able to do i.e what behaviours the object will be able to perform. 

A class defines the attributes of particular object type by providing the names of the instance variables that each object of that class shall have. And the behaviours of these objects are defined as instance methods. 

Objects are essentially the 'things' that are created based on these blueprints i.e classes. So objects are created from classes. And these objects have the attributes and behaviours defined in these classes. 

In Ruby, objects are anything that have a value e.g. strings, integers, floats, arrays and hashes. We can also create custom objects that represent real world things and can provide them with behaviours that model real world behaviour. 

So in summary, classes define the attributes and behaviours of a particular object type. 

For example:

```ruby
class Engineer
  def initialize(name, age, department)
    @name = name
    @age = age
    @department = department
  end

  def introduce
    puts "Hi, My name is #{@name}."
  end

  def design_building
    puts "Designing a building"
  end
end

bob = Engineer.new("Bob", 28, "Structural")
p bob
bob.introduce # #<Engineer:0x000002663f982d10 @name="Bob", @age=28, @department="Structural">
bob.design_building

```

Above we have defined a class `Engineer` that defines some attributes and behaviours for its objects. The attributes of each object are tracked by the instance variables `@name`, `@age` and `@department` that are initialized whenever a new object is created by invoking the `::new` method on this class. The class also defined the instance methods `introduce` and `design_building`. These instance methods represent the behaviours that each `Engineer` object is able to perform.

This is shown with an example above. On line XX we instantiate a new `Engineer` object and assign it to the local variable `bob`. 

On line 38 we output `bob`. As we can see that `bob` object has three instance variables associated with it, each having its own value.

On lines XX and XX we invoke the methods `introduce` and `design_building` on `bob`. These methods the behaviours that `Engineer` object can perform. 

Hence, as we can see with the above example, classe `Engineer` defined the attributes and behaviours that each object of `Engineer` shall have. 


__Q: When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts?__

State describes the data associated with each object. State of an object tracks the attributes defined by the class for that object. Each object has its own unique state. And this state is tracked by the instance variables defined in the class. 

Behaviours are defined as instance methods in the class. And all objects of a class can invoke all the same methods. So essentially, behaviours are shared by all objects of a class.

In summary, each objects state is unique, while behaviour is shared by all objects of a class.

__Q: Given the below usage of the Person class, code the class definition__

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```

__Q: Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now__
Hint: let first_name and last_name be "states" and create an instance method called name that uses those states.

```ruby
class Person
  attr_reader :first_name, :last_name
  attr_writer :last_name

  def initialize(name)
    assign_names(name)
  end

  def assign_names(name)
    names = name.split
    @first_name = names.first
    if names.size == 1
      @last_name = ''
    else
      @last_name = name.split.last
    end
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
```

## 2. Creating Setters and Getters

__Q: What are accessor methods?__
__Q: What are getter and setter methods?__

Accessor methods are used to expose or change information about the state of an object.

There are two types of accessor methods. Getter methods and Setter methods. Both are instance methods that are invoked on a particular object of a class. A class defines these methods.

Getter methods are instance methods that are used to expose information about the state of an object. As state is tracked by instance variables, getter methods return the values of their respective instance variable.

Setter methods are instance methods that are used to change information about the state of an object. Setter methods allow us to reassign their respective instance variables to new values thereby changing the state of an object.

__Q: Explain how the element getter (reference) and setter methods work, and their corresponding syntactical sugar.__

`Array#[]`, `Arrat#[]=`, `Hash#[]` and `Hash#[]=` are actually instance methods. These are fake operators. The reason that they can be used like operators is because Ruby provides this special syntax for them to make the code more readable. It's Ruby's syntactical sugar.

Element getter methods can be used in our custom classes as well. For classes that represent a collection, we can define these instance methods to retrieve or change elements in our custom collection objects.

For example:

```ruby
class Deck
  def initialize
    @cards = []
  end

  def [](index)
    @cards[index]
  end

  def []=(index, value)
    @cards[index] = value
  end
end

deck = Deck.new
deck[0] = "D2"
p deck[0]
```
__Q:We expect the code below to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?__

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.
```
The reason the `change_info` method does not work as expected is because Ruby interprets lines XX-XX as local variable initialization of variables `name`, `height` and `weight` instead of setter method calls `name=`, `height=` and `weight=`. 

To fix this, we need to invoke these setter methods with an explicit `self`. `self` inside an instance method references the calling object i.e. the object that calls the `change_info` method. Using an explicit `self` to invoke setter methods lets Ruby know that we are actually calling setter methods instead of initializing local variables.

```ruby
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
```

## 3. Instance variables and Scope

__Q: What is an instance variable, and how is it related to an object?__

Instance variable are variables that start with an `@` symbol and are in snakecase formatting e.g. `@first_name`.

A class defines the attributes of its objects by specifing the names of the instance variables that each object of that class shall have. These attributes are tracked by the state of each object that is unique to that object. And the state of an object comprises of its instance variables and their vaalues.

So each object has its own copy of these instance variables i.e instance variables are scoped at the object level. So instance variables are used to track the state of objects.

__Q: `ade.grade` outputs `nil` but when we output the `ade` object it shows that it has only one instance variable `@name` associated with it. Why is this?__

```ruby
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
p ade.grade # nil
p ade # #<Student:0x000001c9a01ab4e8 @name="Adewale">
```
Line 217 outputs `nil` because `ade.grade` returns `nil` and that is output by `p`. `#grade` is a getter instance method that returns the value referenced by instance variable `@grade`. If `ade.grade` returns `nil` there could be two reasons for that. One reason could be that `@grade` has been initialized to `nil`. But as we can see in the above code, no where is the `@grade` variable initiailized to any value. Another reason for `nil` return value is that Ruby returns `nil` if uninitialized instance variables are referenced. And this is the actual reason why `ade.grade` returns `nil` because we are referencing an uninitialized instance variable `@grade` in the getter method `grade`.

One might expect that creating getter methods using `attr_*` methods might initialize instance variables to `nil`. But that is not the case. As we can see with the output of line 218, `@grade` is not initialized to `nil`. To initialize `@grade` to `nil` we need to either initialize it in the `initialize` method like this `@grade = grade`. Or we could also call the setter method `ade.grade = nil` after line 216.


__Q: What is the scoping rule for instance variables?__

Instance variables are scoped at the object level i.e. each object has access only to its own copy of the instance variables and cannot access other objects' instance variables even of the same class.

With class or interface inheritance, instance variables are not inherited in either case. If the method that initializes the instance variable is inherited, then that method needs to be invoked first. Only then that instance variable will be initialized.

__Q: How does sub-classing affect instance variables?__

With class inheritance, instance variables are not inherited by subclasses or their objects. However, if the method that initializes the instance variable is inherited, then that method needs to be invoked first. Only then that instance variable will be initialized.

With Interfade inheritance, the same mechanism applies. If the method that initializes the instance variables is inherited from a mixin module, then that instance method needs to be invoked on the object first. Only then the instance variable will be available to the object.

## 4. Class variables and scope

__Q: What is the purpose of a class variable?__

A class variable is a variable that is prefixed with `@@`. Class variables are used to keep track of some data that pertains to the class as a whole. For example number of objects created from the class.

__Q: What are the scoping rules for class variables? What are the two main behaviors of class variables?__

A class variable is scoped at the class level. Unlike instance variables, only one copy of the class variable exists that is available to all objects of the class inside instance methods and is also available inside class methods.

If class inheritance is used then the scope of class variables extends to all the subclasses and their objects as well. A class variable that has been initialized in a superclass is available to all the subclasses and their objects which means that only one copy of the class variable exists that is shared by the superclass, all subclasses of that superclass and all objects of the superclass as well as the subclasses.

__Q:What would the below code return, and why?__

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => ??

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => ??
Vehicle.wheels                              # => ??

class Car < Vehicle
end

Car.wheels                                  # => ??
```
Line XX returns `4` because line XX is the class method `Vehicle::wheels` invocation which returns the value of the class variable `@@wheels` which has been initialized to the integer `4` inside the class `Vehicle` on line XX when this class is loaded by Ruby. 

Line XX is the class method `::wheels` invocation on the class `Motorcycle`. This class method is inherited by the class `Motorcycle` from the class `Vehicle` and returns the value of the class variable `@@wheels`. When the class `Motorcycle` is evaluated by Ruby, Line XX reassigns the class variable `@@wheels` to the integer `2` which is returned by the class method invocation `Motorcycle.wheels` on line XX. This reassignment is possible because only one copy of the class variable `@@wheels` exists that is shared the `Vehicle` class and all its subclasses. Since `@@sheels` was reassigned to `2`, line XX also returns `2`. 

The class `Car` also subclasses from `Vehicle` hence has access to the same class variable `@@wheels`. Line XX is the `::wheels` class method invocation on class `Car` and returns `2` as well. 


## 5. Constants and scope

__Q: What is a constant variable?__

Constants are also a type of variable. Although not technically a variable since the values assigned to them should not be changed even though Ruby allows it and only throws a warning.
A constant is created using all caps letters e.g. `CONSTANT`. Constants have lexical scope which means that it is available throughout the enclosing structure in which it has been initialized i.e. the enclosing module or class. A constant reference is also resolved lexically, that is, when a constant is referenced Ruby searches for the constant definition in the surrounding structure of the constant reference. 

__Q: What are the scoping rules for constant variables?__

Constants have lexical scope which means that a constant is available throughout the enclosing structure in which it has been initialized i.e. the enclosing mofule or class. A constant reference is also resolved lexically, that is, when a constant is referenced Ruby searches for the constant definition for the constant definition in the surrounding structure of the constant reference.

__Q: Describe the error and provide two different ways to fix it.__

```ruby
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires
```

Line XX raises a `NameError` because Ruby is not able to resolve the `WHEELS` constant referenced on line XX in the `Maintanance#change_tires` method. Constant references are resolved lexically which means that Ruby searches for the constant definition in the enclosing structure of the constant reference which in this case is the `Maintenance` module. As `WHEELS` is not defined in this module, Ruby would next search in the inheritance hierarchy of the enclosing structure i.e. the module `Maintenance`'s inheritance hierarchy. Modules dont inherit from any class or module. So next Ruby searches the top level scope i.e. the `main` scope. As it is not defined there either. Ruby raises a `Namerror`.



## 6. Instance methods vs Class methods
__Q: How can we expose information about the state of the object using instance methods?__

State of an object comprises of the object's instance variables and their values and we can use getter instance methods to expose information about the state of an object by returning the value of these instance variables.

```ruby
class Computer
  def initialize(ram)
    @ram = ram
  end

  def ram
    @ram
  end
end

comp1 = Computer.new("8 GB")
comp1.ram # => "8 GB"
```



__Q: What is the difference between instance methods and class methods?__

Instance methods define behaviours that pertain to the objects of a class. They are invoked on instances of a class. Class methods are defined on the class and are also invoked on the class. Class methods define behaviours that pertain to the class as a whole e.g. `total_cats`.

## 7. Method Access Control
__Q: What is Method Access Control?__

Method Access Control is about allowing or restricting access to methods defined in a class using access modifiers. It provides a way in Ruby to implement encapsulation i.e. hiding data and functionality defined in a class so that it is not available to the rest of the code. 

__Q: # How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.__

It is implemented through the use of access modifiers `public`, `private` and `protected`. When any of these methods is called in a class, any methods defined under this modifier will become public, private or protected methods respectively. 

Private methods are methods that can only be invoked inside the class within another instance method by the current object.

Public methods can be called inside as well as outside the class by any object of the class. Public methods make up the public interface of the class and are available everywhere within a program. It is how other classes and objects interact with this class and its objects. Any methods that are defined without the use of access modifiers are public by default.

Protected methods behave like private methods in that, they can only be called within the class however, protected methods can also be called by other objects of the same class other than the current object. This allows sharing of data between objects of the same class. 

All methods are public by default as shown in below example:

```ruby
class Engineer
  def design
    "Designing..."
  end
end

p Engineer.new.design # => "Designing..."
```
In the above example, `design` is a public method by default. We instantiate a new `Engineer` object and are able to invoke the `design` method on it. 

Methods that are not required outside the class and are only performing some function inside the class can be made private methods. These methods often contain some implementation details for public methods. See below example.

We have a `Game` class that has a public method `play`. This `play` method has some implementation details that we dont want to make public e.g. `display_greeting`, `make_move`, `display_winner` and `display_goodbye` methods. So we have made these methods private by placing these method definitions under the `private` method call. These methods can only be invoked inside the class by the current object. As we can see below, the `Game.new.display_greeting` raises a `NoMethodError`

```ruby
class Game
  def play
    display_greeting
    make_move
    display_winner
    display_goodbye
  end

  private
  
  def display_greeting
    # logic
  end

  def make_move
    # logic
  end

  def display_winner
    # logic
  end

  def display_goodbye
    # logic
  end
end

Game.new.play
Game.new.display_greeting # => NoMethodError: private method called
```
Protected methods are used where we dont want to allow access to a method outside the class but we do want to be able to access the method with other objects of the same class other than the current object that called the method. See example below:

In the below example, we have defined the getter method `balance` as protected by placing `attr_reader :balance` under the `protected` method call. The `>` method calls the getter method on two objects, the current object i.e. `self` and the `other_account` object passed in to the `>` method. So on line xx when we call the `>` method on the `account2` object and pass in the `account1` object as an argument, it does not raise an error because the getter method is protected method and can be called in the `>` method with other objects of `BankAccount` other than the current object `account2` that called the `>` method. 

```ruby
class BankAccount
  def initialize(balance)
    @balance = balance
  end
  
  def >(other_account)
    balance > other_account.balance
  end

  protected

  attr_reader :balance
end

account1 = BankAccount.new(150)
account2 = BankAccount.new(200)

puts "Account-2 has more money than Account-1" if account2 > account1 # Account-2 has more money than Account-1
account1.balance # NoMethodError
```



## 8. Referencing and setting instance variables vs. using getters and setters

__Q: How do you decide whether to reference an instance variable or a getter method?__

If getter methods are available, it is better to invoke the getter method instead of referencing an instance variable directly because, there might be some built-in data protection within the getter method that would be bypassed if the instance variable is referenced directly. Referencing instance variables directly exposes the raw data that these variables reference. Getter methods can be used to return a consistently modified version of the instance variable value and any changes to the formatting can be made in one place making future changes easier.

__Q: How do you decide whether to directly set an instance variable or use a setter method?__

if a setter method is available, it is better to use the setter method to initialize or reassign the instance variable instead of setting the instance variable direcly. This way if there is any sort of data validation built-in to the setter method, it would not be by-passed. For example:

```ruby
class BankAccount
  def balance=(balance)
    @balance = balance.to_i if balance.to_f.to_i == balance.to_i
  end
end
```


## 9. Class Inheritance

__Q: What is inheritance?__
Inheritance is a mechanism through a class can inherit behavior from another class or module. The inherited behaviour could instance methods as well as class methods. However, module methods are not inherited. Inheritance allows us to extract common behaviours from classes that share that behaviour and move it to a superclass or module. 

__Q: When is it good to use inheritance?__

__Q: In inheritance, when would it be good to override a method?__

__Q: What will the following code output?__

```ruby
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak
```

__Q: Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.__

```ruby
class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + “Go #{speed} please!”
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
# Expected output:

# Ready to go! Drive fast, please!
```

## 10. Interface Inheritance and Modules

__Q: What is a module?__

__Q: What is a mixin?__

__Q: When creating a hierarchical structure, under what circumstance would a module be useful?__

__Q: What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance?__

__Q: What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?__

```ruby
module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk
```

## 11. Encapsulation

__Q: What is encapsulation, and why is it important in Ruby? Give an example.__

__Q: How do objects and classes exhibit encapsulation. Provide an example of both.__

Encapsulation is the act of hiding or restricting access to data and functionality in a program.

In OOP, objects have some data tied to them known as the state of that object. This data is hidden from the rest of the program i.e. encapsulated within the object, with only the objects having access to this data. This state of an object is tracked by instance variables and each object has access to its own instance variables only. That is, instance variables are scoped at the object level. Hence, objects encapsulate their own states in the form of instance variables.

On the other hand, classes (from which objects are created) define certain behaviours for their objects in the form of instance methods. Some of these instance methods are hidden from the rest of the program while some are made public i.e are available to the users of the class. These methods form the public interface of the class. The instance methods that are hidden are private methods and contain implementation details for the public methods. These private methods can only be invoked inside the class. These private instance methods are said to be encapsulated within the class i.e hidden from the rest of the program while public methods are exposed to the rest of the program. Hence, classes encapsulate i.e hides certain behaviours and expose i.e make public certain behaviours that form the public interface of the class.

## 12. Polymorphism

__Q: What is polymorphism? Explain two different ways to implement polymorphism__

__Q: What is output and why? How does this code demonstrate polymorphism?__

```ruby
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

```



## 13. Method Lookup Path

__Q: What is the method lookup path?__

__Q: How is the method lookup path affected by module mixins and class inheritance?__

__Q: What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.__

```ruby
module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
pingu.fly
```


## 14. `self` and calling methods with `self`

__Q: When would you call a method with `self`?__

__Q: On which lines in the following code does self refer to the instance of the MeMyselfAndI class referenced by i rather than the class itself? Select all that apply.__

```ruby
class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
```
__Q:# In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix? Which use case would be preferred according to best practices in Ruby, and why?__

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```


## 15. Fake Operators and Equality

__Q: How does equivalence work in Ruby?__

__Q: How do you determine if two variables actually point to the same object?__

__Q: What is == in Ruby? How does == know what value to use for comparison?__

__Q: Is it possible to compare two objects of different classes?__

__Q: If we use `==` to compare the individual `Cat` objects in the code below, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?__

```ruby
class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new
```

__Q:How can you make this code function? How is this possible?__

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
End

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
puts "bob is older than kim" if bob > kim
```

## 16. Collaborator Objects

__Q: What is a collaborator object, and what is the purpose of using collaborator objects in OOP?__

__Q:Identify all custom defined objects that act as collaborator objects within the code__

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
```

__Q: We raise an error in the code below. Why? What do `kitty` and `bud` represent in relation to our `Person` object?__

```ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.jump 
```

## 17. Spike