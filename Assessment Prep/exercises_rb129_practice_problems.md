# RB129 Practice Problems
>Description: Student list of Practice Problems to help prep for RB129.  Original list found here: https://docs.google.com/document/d/10JvX-ArkfF8fIWQu8wPaYt7JJHrv_5E0gM0I2uPirwI/edit#

<br />

### Problems To Revise:
| Exercise | Description |
| --- | ----------- |
| #3 | Revise the `why?` responses. |
| #10 | Incomplete. Unsure how to reference a class within a module. |
| #16 | See Pete's response.  |
| #18 | Review for accuracy.  |
| #28Part2 | Complete the `why?` part.  |
| #29 | Accidental Override, explanation completed but finish example  |

### Completed Problems:
| Exercise | Description |
| --- | ----------- |
| [Exercise 1](#ex1) | Instance Variables (`nil`) vs Local Variables (error) |
| [Exercise 2](#ex2) | Instance Variables  (invoke method to initialize) |
| [Exercise 3](#ex3) | Constants have lexical scope |
| [Exercise 4](#ex4) | Adding objects together returns same object type. |
| [Exercise 5](#ex5) | prepend `setter` with `self` |
| [Exercise 6](#ex6) | prepend `setter` with `self` (variable shadowing) |
| [Exercise 7](#ex7) | class variables can be mod by subclasses |
| [Exercise 8](#ex8) | `super`  without explicit args (forwards) |
| [Exercise 9](#ex9) | `super` without explicit args (error)  |
| [Exercise 10](#ex10) | method lookup path (CM-OKBO) |
| [Exercise 11](#ex11) | polymorphism - class inheritance |
| [Exercise 12](#ex12) | collaborator objects |
| [Exercise 13](#ex13) | override unitialized var (`"nil"` => "" ) |
| [Exercise 14](#ex14) | `==` method is fake operator (compares object) |
| [Exercise 15](#ex15) | output object only invokes `to_s` |
| [Exercise 16](#ex16) | invoke `setter` vs instance variable |
| [Exercise 17](#ex17) | invoke `getter` vs `attr_reader` |
| [Exercise 18](#ex18) | class variables when inside instance method must be invoked |
| [Exercise 19](#ex19) | `attr_accessor` not always needed  |
| [Exercise 20](#ex20) | `state` vs behavior |
| [Exercise 21](#ex21) | class methods vs instance method |
| [Exercise 22](#ex22) | collaborator objects |
| [Exercise 23](#ex23) | fake operators |
| [Exercise 24](#ex24) | use cases for `self` |
| [Exercise 25](#ex25) | instance variables |
| [Exercise 26](#ex26) | instance variable scope via class inheritance and mixins |
| [Exercise 27](#ex27) | encapsulation and public interface |
| [Exercise 28 Part1](#ex28Part1) | override `to_s` method, puts method |
| [Exercise 28 Part2](#ex28Part2) | inspect method |
| [Exercise 29](#ex29) | accidental override |
| [Exercise 30](#ex30) | Method Access Control |
| [Exercise 31](#ex31) | modules vs class |
| [Exercise 32](#ex32) | polymporphism types |
<br />
<hr />

## Exercise #1
> What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

```ruby
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
``` 

This code demonstrates a distinction between referencing local variables and instance variables. While referencing an uninitialized local variable raises a `NameError` error, referencing an uninitialized instance variable returns `nil`.

On `line 9`, we invoke the `::new` class method on a `Person` class which returns an object that's assigned to the local variable `bob`.

On `line 10`, we invoke the `name` instance method on the object referenced by `bob` which returns `nil` and outputs `nil`.

To initialize an instance variable, we must first call the method that initializes the variable. Since the `set_name` instance method is never invoked, the `@name` instance variable is not initialized and returns `nil` when referenced.  

<br />
<hr />

## <a name="ex2">Exercise 2</a>
> What is output and why? What does this demonstrate about instance variables?

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
```

This code demonstrates a distinction between referencing local variables and instance variables. Referencing an uninitialized instance variable returns `nil`. However referencing an uninitialized local variable raises a `NameError` error instead.

On `line 15`, we invoke the `::new` class method on a `Dog` class which returns an object that's assigned to the local variable `teddy`.

On `line 16` we invoke the `swim` instance method on the object referenced by `teddy`, which returns `nil` and outputs `nil`. 

This is because the `enable_swimming` instance method that initializes the `@can_swim` instance variable is never invoked and `@can_swim` is not initialized.

Since uninitialized instance variables return `nil`, `@can_swim` returns `nil` when it's referenced within the if conditional statement on `line 11`. This in turn causes the `if` statement to evaluate to `false` and return `nil`. Since it's the last evaluated expression within the `swim` method, `swim` also returns `nil`.

<br />
<hr />

## <a name="ex3">Exercise 3</a>
> What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above

```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides  # Square < Quadrilateral (Constant) < Shape ()
p Square.new.sides 
p Square.new.describe_shape 
```

This code demonstrates that constants have lexical scope. It also demonstrates that a constant initialized in a superclass is inherited by the subclass, and can be accessed by both class methods and instance methods.

On `line 25`, we invoke the `sides` class method on the `Square` class which returns `4` and outputs `4`. 
    Why?
    - It has access to the `SIDES` class method through inheritance.
    - The qualifying namespace for the constant is valid and can be resolved.

On `line 26`, we invoke the `sides` instance method on an a `Square` object, which returns `4` and outputs `4`.
    Why?
    - It has access to the `SIDES` instant method through inheritance.
    - The qualifying namespace for the constant is valid and can be resolved.

On `line 27`, we invoke the `describe_shape` instance method on a `Square` object. Since the `SIDES` constant is referenced within this method without a qualifying namespace, Ruby checks the enclosing module - the `Describable` module, to see if it defines the constant. Since it doesn't find it, Ruby raises a `NameError` error. Within the `describe_shape` method, `self` refers to the `Square` object.


<br />
<hr />

## <a name="ex4">Exercise 4</a>
> What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?

```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 
```

This code outputs an array of `Animal` objects which is not what we would expect when using the `AnimalClass#+`.

When we add two objects together, we expect the evaluated statement to return an object of the same class.  For example, when adding two `Number` objects, `2` and `4`, we expect the evaluated statement to return a `Number` object.  Similarly if we add two `String` objects, `"Hello"` and `"World"`, we expect the evaluated statement to return a `String` object. Since in this case we are adding two `AnimalClass` objects, we expect the evaluated statement to return an `AnimalClass` object but instead it returns and outputs an `Array` object.

We can modify the `AnimalClass#+` method so that the return value is more in line with what we expect by adding a `my_animals` local variable that references an instantiated `AnimalClass` object.  We can then invoke the `AnimalsClass#animals` method to set the `@animals` instance variable to the return value of `animals + other_class.animals`. Finally we can define the `my_animals` local variable as the last line in the `AnimalClass#+` method which will be it's return value when invoked.

Code modified from:
```ruby
def +(other_class)
  animals + other_class.animals
end
```

Code modified to:
```ruby
def +(other_class)
  my_animals = AnimalClass.new("My Animals")
  my_animals.animals = animals + other_class.animals
  my_animals
end
```

<br />
<hr />

## <a name="ex5">Exercise 5</a>
> We expect the code above to output `"Spartacus weighs 45 lbs and is 24 inches tall."  Why does our `change_info` method not work as expected?

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

This code demonstrates that `setter` methods must be prepended with `self` to help Ruby disambiguate between invoking a `setter` method and initializing a local variable.

On `line 22` we invoke the `::new` class method on `GoodDog` class which instantiates a new `GoodDog` object and passes through the arguments `'Spartacus', '12 inches', '10 lbs'` to the initialize method. This new object is assigned to the local variable `sparky`.

On `line 23`, we invoke the `change_info` instance method on a `GoodDog` object referenced by `sparky` and pass in the arguments `'Spartacus', '24 inches', '45 lbs'`. Within this method, rather than invoking the setter methods `name=`, `height=`, and `weight=`, Ruby instead initializes three new local variables `name`, `height`, and `weight` to the values of the arguments passed in.

To let Ruby know we're calling setter methods and not creating local variables, we can modify the code within `change_info` method by prepending `self` as an explicit caller to `name=`, `height=`, and `weight=`. 

Code modified from:
```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```

Code modified to:
```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

<br />
<hr />

## <a name="ex6">Exercise 6</a>
> In this code , we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`? 

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name
```

This code demonstrates that `setter` methods must be prepended with `self` to help Ruby disambiguate between invoking a `setter` method and initializing a local variable.

On `line 13` we invoke the `::new` class method on `Person` class which instantiates a new `Person` object and passes through the string `Bob` as an argument to the initialize method. This new object is assigned to the local variable `bob`.

On `line 14`, we invoke the `name` instance method on the object referenced by `bob` which outputs `Bob` and returns `nil`.

On `line 15`, we invoke the `change_name` instance method on the object referenced by `bob`.  Within this method, rather than invoking the `name=` setter method, Ruby instead creates a local variable `name` that then shadows the `name` getter method which Ruby evaluates to `nil`. This is why when the `upcase` method is invoked on the `name` getter method, it raises a `NoMethodError` error.

To fix this error, on `line 9,` we can prepend `self` as the explicit caller on the `name=` setter method.  This tells Ruby we are invoking a setter method and not creating a local variable. 

With this modification in place when we invoke `name` on the object referenced by `bob` on line 16, it will return `nil` and output `BOB`.

Code modified from:
```ruby
def change_name
  name = name.upcase
end
```

Code modified to:
```ruby
def change_name
  self.name = name.upcase
end
```

<br />
<hr />

## <a name="ex7">Exercise 7</a>
```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels  
```
> What does this code output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?

This code demonstrates that in the context of inheritance, class variables can behave in unexpected and even dangerous ways. This is because when a class variable is defined within a class, there is only one copy of that class variable across all sub-classes and all instances of the classes in the inheritance chain. This means that if we override a class variable from within a sub-class, it will affect the class variable in the super class and all other sub-classes further down the inheritance chain.

On `line 9`, we invoke the `wheels` class method on a `Vehicle` class which outputs `4`. This is because within `Vehicle` on `line 2`, the `@@wheels` class variable has been initialized to `4`.

On `line 15`, we invoke the `wheels` class method on a `Motorcycle` sub-class that inherits from `Vehicle` which outputs `2`. This is because within `Motorcycle` on `line 12`, we override the `@@wheels` class variable and set its value to `2`. 

This affects the `@@wheels` class variable in the `Vehicle` super class and all other sub-classes further down the inheritance chain.  

This is why when on `lines 16, and 20` we invoke the `wheels` class method on the `Vehicle` super class , the output is `2`. 

It's also why when on `line 22` we invoke the `wheels` class method on the `Car` sub-class, the output is `2`. 

<br />
<hr />

## <a name="ex8">Exercise 8</a>
> What is output and why? What does this demonstrate about `super`?

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super # @name = "brown"
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno
```

This code demonstrates how calling `super` with no explicit arguments works.  `super` is a keyword that invokes a method earlier on in the method lookup path that has the same name as the method it is called from.  When `super` is called with no explicit arguments (no parentheses), it passes along any arguments passed to the method in which it is called, over to the method with the same name in the superclass .

In this example we define a `Animal` class with an initialize method that takes in a `name` argument.  We then define a `GoodDog` class that is a subclass to `Animal` and which also has an `initialize` method that takes a `color` argument. The `initialize` method in `GoodDog` overrides the`initialize` method that it inherits from `Animal`.
    
However, within the initialize method in the `GoodDog` subclass, `super` is called with no arguments.  `super` passes along the String `brown` referenced by the `color` argument over to the `initialize` method in `Animal` superclass and invokes it. This initializes the `@name` instance variable wtihin the `initialize` method in the `Animal` superclass to the String `brown.` This explains the presence of `@name="brown"` when the `GoodDog` object is instantiated.  The `initialize` method within `GoodDog` subclass proceeds to initialize the `@color` instance variable to the String `brown`.  Thus when we output the `bruno` object, both `@name` and `@color` instance variables are set to `brown`.

Resources:

https://launchschool.com/exercises/6a35145d

https://launchschool.com/books/oo_ruby/read/inheritance#super

<br />
<hr />

## <a name="ex9">Exercise 9</a>
> What is output and why? What does this demonstrate about `super`? 

```ruby
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")        
```

This code demonstrates how calling `super` with no explicit arguments works.  `super` is a keyword that invokes a method earlier on in the method lookup path that has the same name as the method it is called from.  When `super` is called with no explicit arguments (no parentheses), it passes along any arguments passed to the method in which it is called, over to the method with the same name in the superclass .
  
In this example we define an `Animal` class with an `initialize` method that accepts no arguments.  We also define a `Bear` class that is a subclass to `Animal` that accepts one argument.  The `initialize` method in the `Bear` subclass overrides the `initialize` method that is inherited from the the `Animal` superclass. 
  
However within the `initialize` method of the `Bear` subclass, we call `super` with no argument. `super` passes along the String `black` referenced by the `color` argument from the `initialize` method within the `Bear` subclass over to the `initialize` method in `Animal` superclass and invokes it. Thus when we instantiate a new object on `line 46`, it raises and `ArgumentError` error because we try to pass an argument to the `initialize` method of the `Animal` class which does not accept and arguments. 

Resources: 

https://launchschool.com/exercises/6a35145d

https://launchschool.com/books/oo_ruby/read/inheritance#super

<br />
<hr />

## <a name="ex10">Exercise 10</a>
> What is the method lookup path used when invoking `#walk` on `good_dog`?

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end
  
  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
```

This code demonstrates how Ruby traverses through the method lookup path whenever a method is invoked.  The method lookup path is the distinct path that ruby follows whenever a method is invoked.

This code demonstrates the distinct path that ruby follows when 

This code demonstrates how Ruby traverses through the method lookup path which is the distinct path that Ruby follows whenever a method is invoked.

In this example, we are using a module for namespacing where we group related classes together within a `GoodAnimals` module.  

<br />
<hr />

## <a name="ex11">Exercise 11</a>
> What is the method lookup path used when invoking `#walk` on `good_dog`?

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
> What is output and why? How does this code demonstrate polymorphism? 

This code outputs, `"I eat"`, `"I eat plankton."`, and `"I eat kibble."` 

This is an example of polymporhism through inheritance in which objects of different types can respond to the same method invocation simply by overriding a method from the superclass.

In this example we define a `Animal` class with a `eat` method.  We also define a `Fish` class and `Dog` class that both subclass from `Animal` where they override the `eat` method that they inherit, and implement their own specialized verson of this method. 

Even though every object in the `array_of_animals` array is a different object type, each with their own implementation of the `eat` method, the client code only cares that the objects can respond to the same `eat` method invocation.

<br />
<hr />

## <a name="ex12">Exercise 12</a>
> We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?

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

This code raises an error because on `line 28`, `pets` references an array containing the collaborator objects referenced by `kitty` and `bud`, and since the `Array` class does not have a `jump` method, Ruby raises an error.  

To avoid the error, we can iterate through the `pets` array and invoke the `jump` method on both the `kitty` and `bud` objects instead.

code modified to:
```ruby
  bob.pets.each do |pet|
    pet.jump
  end
```

<br />
<hr />

## <a name="ex13">Exercise 13</a>
> What is output and why?

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name   
```

In this example we define an `Animal` class with an initialize method that takes one `name` argument that assigned to the `@name` instance variable.  We also define a `Dog` class that is a subclass to the `Animal` superclass.  `Dog` class inherits the `intialize` method from `Animal` and overrides it.  However the value of the `name` argument within the `Dog#initialize` method is never assigned to an `@name` instance variable.  Hence when on `line 11`, we reference the `@name` instance variable within the `dog_name` method, `@name` is uninitialized and returns `nil`. 

This is why on line When we invoke the `dog_name` on the `Dog` object referenced by `teddy`, we output `"bark! bark!  bark! bark!"` since @name evaluates to `nil`.

<br />
<hr />

## <a name="ex14">Exercise 14</a>
> In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`? 

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```

In this example rather than compare the `state` of the objects we are comparing the objects themselves. For `line 11` to evaluate to `true`, we can define a custom `==` comparison operator within `Person`, that compares the values that `@name` instance variable references.
  
code added:
```ruby
  def ==(other)
    name == other.name
  end
```

> Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?

The are not the same object. We can prove this by invoking the `object_id` on the return value of `al.name` and `alex.name`

code modified:
```ruby
p al.name.object_id 
p alex.name.object_id 
```

<br />
<hr />

## <a name="ex15">Exercise 15</a>
>What is output on `lines 14, 15, and 16` and why?

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name 
puts bob      
puts bob.name 
```

On `line 13` we invoke the `::new` class method on `Person` class which instantiates a new `Person` object and passes the string `Bob` as an argument to the initialize method, where it's used to initialize the `@name` instance variable. This new object is assigned to the local variable `bob`.

On `line 14`, we invoke the `name` instance method on the object referenced by `bob` which outputs `Bob`. This works because on `line 2`, the `attr_reader :name` automatically created the `name` getter method.

On `line 15`, the `bob` object is passed as an argument to the `puts` method invocation which ouputs `"My name is BOB"`. This is because within the `Person` class, we have defined a custom `to_s` method that is invoked whenever we call `puts` on the object itself, and where the `upcase!` method mutates the calling object referenced by `name`.  Hence the value referenced by `name` is permanently modified to `BOB`. 

This explains why when we invoke the `name` method on the object referenced by `bob` on `line 16`, it outputs the String `"BOB"` .

<br />
<hr />

## <a name="ex16">Exercise 16</a>
> Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.

see: https://launchschool.com/posts/1d26e504

<br />
<hr />

## <a name="ex17">Exercise 17</a>
> Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`

One example where it makes sense to write a custom getter method over `attr_reader` is when we may not want to display the raw data, such as password, phone number, or social security number, but perhaps only display partial information.  In this case we can define our custom method instead.

```ruby
class Person
  def initialize(name, phone_number)
    @name = name
    @phone_number = phone_number
  end

  def phone_number
    @phone_number[-4..-1]
  end
end

bob = Person.new("Bob","9999876543")
p bob.phone_number 
```

<br />
<hr />

## <a name="ex18">Exercise 18</a>
> What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?

```ruby
class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end
```

`Triangle.sides` returns  `nil`
`Triangle.new.sides` returns `3`

This code demonstrates that class variables are accessible by the subclass where the subclass is allowed to override the class variable in a super-class. The change to the class variable will affect all other subclasses of the superclass.

This also demonstrates that when a class variable is initialized in a class, there is no method to explicitly invoke to initialize it. The class variable is loaded when the class is evaluated by Ruby. 

However, when a class variable is intialized or reassigned within an class method or instance method, the class method or instance method must be invoked in order for the value of the class variable to be set to a new value.

see additional examples below
```ruby
# Example 1
class Person
  @@name = "Bob"
  
  def self.some_class_method
    @@name
  end
    
  def some_instance_method
    @@name = "Tom"
  end
  
  def self.some_other_class_method
    @@name = "Mary"
  end

end

p Person.some_class_method # => "Bob"
p Person.new.some_instance_method # => "Tom"
p Person.some_other_class_method # => "Mary"


# Example 2
class Person
  
  def self.some_class_method
    @@name = "Bob"
  end
  
  def some_instance_method
    @@name
  end

end

# run this line seperate from bottom two
p Person.new.some_instance_method # => raises an error

p Person.some_class_method # => "Bob"
p Person.new.some_instance_method # => "Bob"


# Example 3
class Person
    
  def some_instance_method
    @@name = "Tom"
  end
  
  def self.some_class_method
    @@name
  end

end

# run this line sepearte from bottom two
p Person.some_class_method # => raises an error

p Person.new.some_instance_method # => "Tom"
p Person.some_class_method # => "Tome"
```

<br />
<hr />

## <a name="ex19">Exercise 19</a>
> What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.

The `attr_accessor` method is Ruby's built-in way to automatically create both `getter` and `setter` methods which allow us to access and set the values of intance variables. 

There are times when we may only want the user to view certain information without having the ability to modify it, in this case we may only want to invoke the `attr_reader` which creates a `getter` method for an instance variable.  Likewise, there are times when we may only want the user to be able to modify the data but need to present the that data in different format. In this case we may want to invoke an `attr_writer` to create a `setter` method for an instance variable and a custom method to expose the data.

Additional possibly unecessary info:
Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and the properties that users of the object need. We can use Method Access Control to hide or expose the properties and methods through the public interface of a class.  

Classes should have as few public methods as possible to help protect our data from unwanted changes or manipulation. Creating only the neceessary methods simplifies using a class and reduces the need for having to figure out which methods to hide and which to expose. 

```ruby
# Use case example of when using attr_accessor is not always necessary.
class Person
  
  attr_reader :race
  attr_writer :name
  attr_accessor :title

  def initialize(title, name, race)
    @title = title
    @name = name
    @race = race
  end
  
  def name
    "#{title} #{@name}"
  end
  
end

jane = Person.new("Ms", "Jane Smith ", "White")
puts jane.name
jane.title = "Mrs"
jane.name = "Jane Jones" 
puts jane.name
puts jane.race
```

In this example the `race` attribute is not something that will change, in this case, it does not make sense to add the ability to update the value of this attribute once it has been set.  `name` however can change, but perhaps we may want to create a custom method for displaying the information such as including the `title`.

<br />
<hr />

## <a name="ex20">Exercise 20</a>
> What is the difference between states and behaviors?

In Ruby we define the attributes and behaviors for objects in classes. `state` tracks attributes for individual objects which represent what an object is made of. Behaviors is what an object can do. Classes group common behavior and objects encapsulate `state`. As such, all objects of a class have the same behavior but different `state`.

Each object has a unique `state` which is comprised of the instance variables and their values.  The behaviors of an object are defined by the instance methods that can be called or invoked on the object and which the object can respond to.

|Resources:
| --
|https://launchschool.com/books/oo_ruby/read/the_object_model#whatareobjects
|https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#statesandbehaviors
|https://launchschool.com/lessons/dfff5f6b/assignments/4228f149

<br />
<hr />

## <a name="ex21">Exercise 21</a> 
> What is the difference between instance methods and class methods?

Here are some differences between `instance methods` and `class methods`

`instance methods` are methods that are called on an instance of a class. We can use instance methods to `set` or `expose` information about the `state` of an object. Instance methods is how we define the behaviors in a class that describe what an object can do. We use instance methods to define functionality that pertains to individual objects.

```ruby
# example of class with instance methods
class Customer
  def initialize(name)
    @name = name
  end
  
  def greeting
    puts "Good day #{@name}"
  end
end
  
bob = Customer.new("Bob")
bob.greeting 
```

`class methods` are methods that we can call on the class directly without having to instantiate any objects.  This is because class methods belong to the class itself. We use class methods to define functionality that does not  pertain to individual objects 

Unlike instance methods, class methods must be prepended with the `self` keyword in front of the method name.

```ruby
class Customer
  def self.who_am_i
    puts "I am a class method"
  end
end

Customer.who_am_i
```

<br />
<hr />

## <a name="ex22">Exercise 22</a>

> What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

Collaborator objects are objects that are stored as state within another object. Collaborator objects can be of any data type and in fact an example of ones we've already used are when we initialize instance variables for our objects to string or numbers such as, `@name = "Bob"`. 

More often however, when we work with collaborator objects, they are usually custom objects.  You can think of the relationship between collaborator objects as that of `association` as in `has-a` relationship.  For example, a purchase order `has-a` item. See example below:


```ruby
class PurchaseOrder
  def initialize(id)
    @id = id
    @items = []
  end

  def <<(item)
    @items << item
  end
  
  def display_items
    puts "The items for order #{@id} are:"
    puts @items
    puts 
  end
end

class Item 
  def initialize(name)
    @name = name
  end
  
  def to_s
    "#{@name}"
  end
end

purchase_order_1 = PurchaseOrder.new(1)
shoes = Item.new("shoes")
shirt = Item.new("shirt") 
purchase_order_1 << shoes << shirt
puts purchase_order_1.display_items
```

| Resources
| --- 
|https://launchschool.com/lessons/dfff5f6b/assignments/4228f149
|https://medium.com/launch-school/no-object-is-an-island-707e59ffedb4

<br />
<hr />

## <a name="ex23">Exercise 23</a>

> How and why would we implement a fake operator in a custom class? Give an example.

Fake operators are actual methods that only appear or look like operators due to Ruby's syntatical sugar when invoking those methods.  Instead of calling some of these methods normally as `obj.method(arg)`, we can instead invoke  them as `obj method arg`.  An example of this is the the `==` method where instead of using the `2.==(2.0)` we can simply use `2 == 2.0` instead.

<br />
<hr />

## <a name="ex24">Exercise 24</a>

> What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.

The reserved word `self` is a way of being explicity about what our program is referencing and what our intentions are as far as behavior.

`self` refers to the calling object:

Inside a class and inside an instance method `self` refers to the instance of the class that called the method - the calling object.
Inside a class and outside an instance method `self` refers to the class itself an can be used to define a class method.

Example of using `self` inside a class but outside an instance method
```ruby
class Customer
  
  self
  
  def self.who_am_i
    self
  end
  
  def who_am_i
    self
  end
end

puts Customer  # => Customer
puts Customer.who_am_i # => Customer
puts Customer.new.who_am_i # => #<Customer:0x000056289f7ce890>
```

When invoking setter methods from within the class, they must be denoted with the reserved word `self`. This allows ruby to differentiate between initializing a local variable and invoking a setter method.

Example of using `self` as explicit caller with `rename` setter method
```ruby
class Customer
  attr_accessor :name, :rename

  def initialize(name)
    @name = name
  end
  
  def rename(n)
    self.name = n
  end
end

tom = Customer.new('Tom')
puts tom.name # => Tom
tom.rename('Thomas')
puts tom.name # => Thomas
```

In this example, within the `rename` instance method, we prepend `self` in front of name. This lets Ruby know that we are invoking the setter method name on the class instance that kitty points to.

<br />
<hr />

## <a name="ex25">Exercise 25</a>

> What does this code demonstrate about how instance variables are scoped?

```ruby
class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"
```

`instance variables` is how we tie data to objects.  In Ruby, objects encapsulate state, and we use instance variables to track the individual object state. Since instance variables are scoped at the object level, they do not cross between objects, even if the objects belong to the same class. Once an instance variable is initialized within an instance method, it can be referenced from any instance method of the class the object is instantiated from, without having to be passed in.  

In this example, we instantiate two objects and assign them individually to the local variables `bob` and `joe`. During instantiation, the `@name` instance variable of the `bob` object is initialized to the string `bob` and the `@name` instance variable of the `joe` object is initialize to the string `joe`,  Since instance variables are scoped at the object level with each object encapsulating its own `state`, the value of the `@name` instance variable in the `bob` object does not cross over to `joe` and vice versa. Thus when we invoke the `get_name` method on the object referenced by `bob`, it can only return the string `"bob"`.

| Resources |
| --- |
|https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#instancevariables
|https://launchschool.com/lessons/d2f05460/assignments/b4f9e5b7

<br />
<hr />

## <a name="ex26">Exercise 26</a>

>  How do class inheritance and mixing in modules affect instance variable scope? Give an example?

 In order to be able to reference an instance variable the instance method that initializes the instance variable must be invoked. In the context of variable scope via inheritance and mixing in modules, although instance variables and their values are not inherited, we can still access them from a subclass since the instance methods where they are initialized are in fact inherited.

Example of variable scope via class inheritance 
```ruby
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
end

bob = Customer.new("Bob")
puts bob.name
```

Example of variable scope via mixins
```ruby
module Rewardable
  def has_rewards
    @rewards = true
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
end

class Member < Customer
  include Rewardable
  
  def use_rewards
    "Apply rewards towards purchase" if @rewards
  end
end

bob = Member.new("Bob")
bob.has_rewards
puts bob.use_rewards
```

| Resources |
| --- |
|https://launchschool.com/lessons/d2f05460/assignments/b8928e96
|https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1

<br />
<hr />

## <a name="ex27">Exercise 27</a>

> How does encapsulation relate to the public interface of a class?

Encapsulation lets us hide the internal representation of objects from the outside and only expose the methods and properties that the client needs. In Ruby, we achieve encapsulation by creating objects and exposing interfaces to interact with those objects.   

We can implement Method Access Control to qualify methods as public, private or protected which determines what methods and properties are exposed through the public interface of a class.  Note that with the exception of the `initialize` method, instance methods are public by default.

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Bob")
puts bob.name # => Bob
```

<br />
<hr />

## <a name="ex28Part1">Exercise 28 Part1</a>
> What is output and why? How could we output a message of our choice instead?

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky
```

This code outputs the object's class name and an encoding of the object id. 

Every class has a `#to_s` method. When we use `puts`, it invokes the `to_s` method for every argument that's passed to it in order to convert the value to a string representation.

Since we do not override the `to_s` method within the `GoodDog` class, it uses the `to_s` method that it inherits which by default prints the object's class and an encoding of the object id.

To print a useful output, we can can overrride the inherited `to_s` method by defining our own within the `Person` class.

| Resources |
| --- |
|https://ruby-doc.org/core-3.0.2/Object.html#method-i-to_s
|https://launchschool.com/exercises/e7ca751c
|https://launchschool.com/exercises/6a35145d

<br />
<hr />

## <a name="ex28Part2">Exercise 28 Part2</a>
> How is the output above different than the output of the code below, and why?

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky
```

This code outputs the object's class name, an encoding of its memory address, and a list of the instance variables and their values.

TODO: Why is it different than the code above?

| Resources |
| --- |
|https://ruby-doc.org/core-3.0.2/Object.html#method-i-inspect

<br />
<hr />

## <a name="ex29">Exercise 29</a>
> When does accidental method overriding occur, and why? Give an example.

Since every class inherently subclasses from the `Object` class, methods defined in the `Object` class are available in all classes. This means we through inheritance we have access to t Because inheritance allows us to override a method from a superclass, we can accidently override a method that was defined in the `Object` class. 

The `Object#send` method is one example where due to its name, one may accidently override the inherited method if one is not aware the method exists.

```ruby
  def Email
    def initialize(sender, recipient, subject, body)
      @sender = sender
      @recipient = recipient
      @subject = subject
      @body = body
    end

    def send()
      # implementation goes her
    end
  end

  my_email = Email("bob@gmail.com", "joe@gmail.com", "Greetings", "Hope all is well!")
  my_email.send(:)
```

<br />
<hr />

## <a name="ex30">Exercise 30</a>
> How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

Encapsulation allows us to hide the internal representation of an object, and only expose the necessary methods and properties that the client needs.  By implementing Method Access Control through the use of access modifiers, we can define methods as `public`, `private`, or `protected`. This restricts or allows access to the methods defined in a class.

Methods defined as `public` are accessible both inside and outside the class. They comprise the interface of a class. This means that the class and objects of that class are accessible by other classes and objects. Unless we use the `private` or `protected` access modifiers before a method definition, most methods that we define are public by default.

Methods defined as `private` are only accessible from within the class and only the current instance has access to them. When methods don't need to be accessed outside the class, we can define them as `private` in order to restrict access. As of Ruby 2.7, private methods can be called with a literal `self` as the caller.  The explicit caller is limited to the current object only and not any other object, even if the other object belongs to the same class.

Methods defined as `protected` are accessible within the class just like public methods, however outside the class, they act just like private methods. A notable difference between private and protected methods is protected methods allow access between class instances, while private methods do not. Like private methods we can call protected methods with `self` as an explicit caller. In addition to `self` however, we can also use other objects as the explicit caller, so long as they belong to the same class as the current object.

It's more common to define methods as `public` or `private`. Whenever possible, one should define as few public methods as possible. This ensures that users can access only what's needed to interact with a class or object of a class.


Example of a class with a public method
```ruby
class Customer
  attr_accessor :name
end

customer1 = Customer.new
customer1.name = "Bob"
puts customer1.name
```
In this example we use `attr_accessor` to automatically create the `name` getter and setter methods. Since these methods are `public` methods, they can be accessed both inside and outside the class.  We use `name` setter method to set the value of `@name` instance variable for the `customer1` object to the string `Bob`, and use the `name` getter method to return and output the value of `@name` for `customer1`.
<hr />

Example of a class with private methods
```ruby
class Customer
  attr_writer :name

  def display_name
    name
  end
  
  private
  
  attr_reader :name
end

customer1 = Customer.new
customer1.name = "Bob"
puts customer1.display_name # => Bob
# puts customer1.name # => raises a "NoMethodError" error

```

In this example we use the `attr_writer` to automatically create the `name` setter method. Since `name` setter method is a public method, we can invoke it both inside and outside the class. Here we invoke it on `customer1` to set the name of the `customer1` object to to the String `Bob`.

Within the class, we also use the `attr_reader` to automatically create the `name` getter method. However because we've invoke the `private` accessor modifier before the `attr_reader` definition, these methods are private. Thus the `name` getter method can only be accessed within the class.  

However because `display_name` method has been defined inside the class as a public method, and can access the `name` getter method, we use it outside the class to output the value of the `@name` instance variable for the `customer1` object.

<hr />

Example of a class with a protected method.
```ruby
  class Customer
    attr_writer :name

    def ==(other)
      self.name == other.name
    end

    protected

    attr_reader :name
  end

  customer1 = Customer.new
  customer2 = Customer.new

  customer1.name = "Bob"
  customer2.name = "Tom"

  puts customer1 == customer2
```

In this example we use the `attr_writer` to automatically create the `name` setter method. Since `name` setter method is a public method, we can invoke it outside the class. Here we invoke it outside the class on `customer1` to set the name of the `customer1` object to to the String `Bob`. We also invoke it outside the class on `customer2` to set the name of the `customer2` object to to the String `Tom`

Within the class, we use the `attr_reader` to automatically create the `name` getter method. However because we've invoke the `protected` accessor modifier before the `attr_reader` definition, these methods are protected.  This means that the `name` getter method can only be accessed within the class. It does however allow access between class instances.

Here we define the `==` getter method as `public`, which can access the `name` getter method which is `protected`.  We pass `customer2` as an argument into `==` where we compare the values of the `@name` instance variables for `customer1` and `customer2` objects. This returns the boolean `False`, which we use to output.

| Resources |
| --- |
|https://launchschool.com/books/oo_ruby/read/inheritance#privateprotectedandpublic
|https://launchschool.com/exercises/15b002de
|https://launchschool.com/exercises/acb6e2b2
|https://launchschool.com/exercises/001419ed
|https://rubyreferences.github.io/rubychanges/2.7.html


<br />
<hr />

## <a name="ex31">Exercise 31</a>
> Describe the distinction between modules and classes

Here are a few distinctions between classes and modules:
* While you can instantiate objects from a class, you cannot instantiate an object from a module.
* A class is where we put methods that fall into a hierarchy system. A module is where we place methods that do not fall into a hierarchy system. 
* A class can inherit but a module can not.


<br />
<hr />

## <a name="ex32">Exercise 32</a>
What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

Polymorphism is the ability for objects of different types to respond to the same message or method invocation that can lead to more maintainable code.

Polymorphism is one of the pillars of OOP that helps lead to more maintainable code.  Polymorphism is the ability for objects of different types to respond to the same message or method invocation. What this means in practical terms is that if two objects of different types each have a method with the same name (even if the implementation is different), we can invoke the method name on both objects without worrying about the their type.

There are two primary ways to implement polymorphism:
* Polymorphism through inheritance
* Polymorphism through duck typing.

**Example of Polymorphism through Inheritance:**
```ruby
class Player
  def pass
    puts "Do nothing"
  end
end

class BasketballPlayer < Player
  def pass
    puts "Throw ball"
  end
end

class SoccerPlayer < Player
  def pass
    puts "Kick ball"
  end
end

class CardPlayer < Player
end

players = [BasketballPlayer.new, SoccerPlayer.new, CardPlayer.new]
players.each do |player|
  player.pass
end
```

This code demonstrates polymorphism through inheritance, where the interface for the class hierachy allows objects of different types to respond to the same method invocation even if the method implementaton is different.

Although each object in the `players` array is of a different type, the client code can invoke a `pass` method on each of the different `player` objects because each of those objects has a `pass` method. 

The `BaskeballPlayer` class and a `SoccerPlayer` class both subclass from `Player`. Although both subclasses inherit a `pass` method from the superclass, each subclass overrides the method with their own implementation. Thus when we call `pass` on a `BasketballPlayer` object or `SoccerPlayer` object, the object will use the method defined within its respective class. This is polymporhism through inheritance in which objects of different types can respond to the same message simply by overriding a method from the superclass.

The `CardPlayer` class subclasses from `Player` and it inherits a `pass` method from the superclass. Instead of providing its own implementation for the `pass` method, it uses inheritance to acquire the the behavior of the `Player` superclass. Thus when we call `pass` on a `CardPlayer` object, it will use the inherited method that is defined within the `Player` superclass. This is polymorphism through inheritance in which objects of different types can respond to the same message simply by inheriting a method from the superclass.
 
**Example of Polymorphism through Duck Typing:**
```ruby
class Person
  def run
    puts "I run on 2 legs"
  end
end

class Dog
  def run
    puts "I run on 4 legs"
  end
end

runners = [Person.new, Dog.new]
runners.each do |runner|
    runner.run
end
```

This code demonstrates polymorphism through duck typing. With Duck Typing we are not concerned with the object's type or class, instead we only care that the object has the ability to respond to the same method invocation, even if the method implementation is different.

Although each object in the `runners` array is of a different type, the client code can invoke a `run` method on each of the different `runner` objects because each of those objects has a `run` method. 

The `Person` class and the `Dog` class each define their own `run` method with different implementation. Thus when we call `run` on a `Person` object or `Dog` object, the object will use the method defined within its respective class. This is Polymorphism through Duck Typing in which objects of unrelated types can respond to the same method invocation, even if the implementation is different. 

| Resources
| --
| https://launchschool.com/lessons/dfff5f6b/assignments/8c6b8604
| https://launchschool.com/posts/4113bb2d
| https://launchschool.com/posts/d28ba82d