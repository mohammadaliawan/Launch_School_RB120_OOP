# RB120 Praciice Problems

## Instance variables/ Setter and Getter methods

__What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?__

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
Line 15 outputs `nil`. 

On line 15, the instance method `name` was invoked on the `Person` object referenced by the local variable `bob` which was instantiated on line 14.

`name` is a getter method that returns the value of the `@name` instance variable.

`bob.name` returns `nil` because the `@name` isntance variable is not yet initialized. So Ruby returns `nil` when uninitialized instance variables are referenced.

This differentiates instance variables from local variables in the way that when an unintialized local variable is referenced, an exception is raised.

We can fix this by first invoking the `set_name` method that will assign the `@name` instance variable to the string object `"Bob"` and after this we can invoke the getter method `name` which will now return `"Bob"`. 

__Q2: What is output and why? What does this demonstrate about instance variables?__

```ruby
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim  
```

Line 49 outputs `nil`. On line 49 the instance method `Dog#swim` is invoked on the object referenced by the local variable `teddy` which was instantiated from the `Dog` class on line 48. 

In the `Dog#swim` method, the `@can_swim` instance variable is not yet initialized so Ruby will return `nil`. Since `nil` is falsey, the `if` conditional on line 44 returns `nil` which is then returned by the `swim` method on line 49 and output by `p`.

This demostrates two concepts about instance variables. First, that when uninitialized instance variables are referenced, Ruby returns `nil`. Second, that instance variables are not inherited. Although the `Swimmable` module is mixed in the `Dog` class and the `enable_swimming` method is inherited by `Dog` class, this does not mean that the `@can_swim` method has been initialized to `true`. We must first invoke the method that initializes the instance variable before we can reference it.

SO this can be fixed by first invoking the inherited method `enable_swimming` on the `teddy` object and then invoking the `swim` method on `teddy`.

## Constant Scope

__Q3: What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?__

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

p Square.sides  # 4
p Square.new.sides # 4
p Square.new.describe_shape # NameError
```

Line 87 outputs `4`. The class method `::sides` is invoked on the class `Square`. This method is inherited by `Square` from its superclass `Shape`. On line 73 in the `::sides` method, `self` refers to the class `Square` as that is the class that invoked the `::sides` method on line 87. So line 73 evaluates as `Square::SIDES`. `::` is the constant resolution operator which means that Ruby will first look for the constant `SIDES` in the `Square` class. But this constant is not defined in `Square` so next Ruby inspects the inheritane heirarchy for `Square` . The next class Ruby will look in is the `Quadritlateral` class as that is the immediate superclass for `Square`. On line 82, the `SIDES` constant is initialized and assigned to `4`. So on 73, `self::SIDES` returns `4` which is then returned by the `::sides` method invocation on line 87 and output by `p`.

Line 88 also outputs `4`. On this line, we are instantiating a `Square` object and invoking the instance method `sides`. The `#sides` method is inherited by `Square` from its superclass `Shape`. So this method is invoked. In the `#sides` method on line 77 `self` refers to the calling object which in this case is the `Square` object. So `self.class` returns `Square`. The `::` on line 77 is the constant resolution operator. So `Square::SIDES` means that Ruby will first search for the constant `SIDES` in the lexical scope of the `Square` class. As this constant is not defined in `Square`, Ruby will then search in the inheritance heiarchy of the `Square` class. The next class Ruby inspects is the `Quadrilateral` class where `SIDES` is initialized to `4`. So the line the constant reference `self.class::SIDES` will be resolved and this expression will return `4`. So the `#sides` method invocation on line 88 returns `4` and that is output by `p`.

 Line 91 raises an error specifically a `NameError`. On this line, a new `Square` object is instantiated and the `descibe_shape` method is invoked on it. This method is inherited by `Square` class and it objects from the `Describable` module which is mixed in the `Shape` class which is a superclass for `Square`. In this method, string interpolation is used to interpolate `self.class` and `SIDES`. `self` here references the calling object i.e the `Square` object that called the `describe_shape` method. So `self.class` returns `Square`. `SIDES` is a constant reference. Constants have lexical scope which means that Ruby will look for this constant in the enclosing structure of the constant reference. So Ruby inspects the `Describable` module for this constant. But it is not defined in this module. Since modules dont have an inheritance heirarchy, Ruby next looks in the top level scope i.e. the `main` scope and its also not defined in the `main` scope. Since Ruby does not find `SIDES` it raises a `NameError`.

 On line 91 a new `Square` object is instantiated and the `describe_shape` method is invoked on this object. This method, inherited fromt the `Describable` module, returns a string with the `SIDES` constant interpolated into it. Ruby looks for this constant in the lexical scope of the constant reference which is the enclosing module `Describable`. But this constant is not defined in the module. Next Ruby tries the inheritance heirarchy of the module, but modules dont inherit from any class. Finally, Ruby looks for it in the `main` scope. Not finding it anywhere, it raises a `NameError`. The `self` on line 67 references the calling object i.e. the `Square` object. So `self.class` returns `Square`.

 __Q4: What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?__

- What is output
- Is this what we would expect when using `AnimalClass#+
- how could we adjust the implementation of `AnimalClass#+`

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
    temp_obj = AnimalClass.new("Temp Animal")
    temp.animals=(animals + other_class.animals)
    temp_obj
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

Line 150 outputs an array object containing `Animal` objects. All objects that were appended to `@animals` instance variables for `mammals` and `birds` are included in this array. This is not what we would expect `AnimalClass#+` method to return. We would expect it to return a new `AnimalClass` object whose instance variable `@animals` contains all the `Animal` objects that were appended to  `mammals` and `birds`.

We can change the implementation of `#+` as shown in the above code.

__Q5:We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?__

- Why does our `change_info` method not work as expecte
- expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n # self.name = n
    height = h # self.height = h
    weight = w # self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
```

We expect the `change_info` method to reassign the instance variables `@name`, `@height` and `@weight` to the strings passed in as arguments to this method using the setter methods `name=`, `height=` and `weight=`. However, lines 173-175 are interpreted by Ruby as the initialization of new local variables `name`,`height` and `weight` instead of setter method calls i.e. `name=`, `height=` and `weight=`. As these line are local variable initializations, the `@name`, `@height` and `@weight` are not reassigned which is why the `info` method invocation on line 184 returns a string with the initial values of `@name`, `@height` and `@weight`.

To tell Ruby that we are invoking setter methods and not initializing local variables, we need to invoke the setter methods with an explicit caller `self`. `self` inside an instance method references the calling object which in this case is the object referenced by `sparky`.

Another way to achieve the expected result is to reassign instance variables directly. That is, `@name = n`, `@height = h` and `@weight = w`. But this way is not recommended. The reason for this is that setter methods might include some data validations which are bypassed if instance variables are assigned directly. 

__Q6: In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?__

 hope to output `'BOB'` on `line 16`
 Instead, we raise an error. Why # line 214 raises an error
How could we adjust this code to output `'BOB'`

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
p bob.name # outputs "Bob"
bob.change_name
p bob.name # expected "BOB"
```
Line 214 raises an error `NoMethodError`. On line 214 we are invoking the `change_name` method on the `Person` object referenced by local variable `bob`. On line 207 to 209 the `change_info` method is defined. In this method, line 208 is interpreted by Ruby as the initialization of a new local variable `name` instead of a setter method call i.e. `name=` which is why the error is raised. We can fix this by invoking the setter method `name=` with an explicit `self` to distinguish it from the initialization of a local variable. This way `name.upcase` will be interpreted by Ruby as the getter method call `name` and then calling `upcase` on the string returned by `name`. The returned string object `BOB` will then be passed in to the setter method `name=` as argument and will be assigned to the `@name` instance variable. On line 215, `bob.name` will return the value for `@name` which has now been reassigned to `"BOB"` and this will be output by the method invocation `p`.

Line 214 raises a `NoMethodError` because line 208 inside the `change_name` method is interpreted by Ruby as the initialization of a new local variable `name` instead of the setter method call `name=`. To call the setter method `name=` we need to invoke the method with an explicit `self` like this `self.name = name.upcase`. `self` here will reference the calling object referenced by `bob`. This will be interpreted by Ruby as the setter method call `name=` and `name.upcase` will be interpreted as the invocation of getter method `name` and then `upcase` method invocation on the string object returned by `name`. `name.upcase` will return the string `"BOB"` which will then be passed to the setter method `name=` as an argument. `name=` will reassign the instance variable `@name` to `"BOB"`. So on line 215 the `bob.name` getter method invocation will return the new value of `@name` i.e. `"BOB"` and will be output by `p`.

__Q7: What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?__

 What does the code above output,
  and why
  What does this demonstrate about class variables
  why we should avoid using class variables when working with inheritance

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
Line 237 outputs `4`. On line 237 we are invoking the class method `::wheels` on the class `Vehicle`. `::wheels` is a class method defined on lines 232-234. It returns the value for the class variable `@@wheels`. `@wheels` is initialized on line 230 to the integer `4` when the class is loaded. So `Vehicle.wheels` returns `4` on line 237 which is passed in to the method invocation `p` and is output.

Line 243 and 244 output `2`. On line 239-241 we are defining the class `Motorcycle` as the subclass of `Vehicle`. Inside this class, on line 240 we are reassigning the class variable `@@wheel` to `2`. We are able to do this because all subclasses of a class share one copy of the class variable that has been initialized in a superclass. So a subclass can reassign the class variable. On line 243 we are invoking the class method `::wheels` on the `Motorcycle` class. `::wheels` is inheritd by `Motorcycle` from `Vehicle`. `Motorcycle.wheels` on line 243 returns `2` as `@@wheels` was reassigned to `2` in `Motorcycle` class. Line 244 outputs `2` as well because of the same reason.

Lines 248-250 all output `2` because as said earlier, a class variable that has been initialized in a superclass is available to all subclasses and its objects. So it available to `Car` as well which has been defined on line 246 as a subclass of `Vehicle`.

__Q8: # What is output and why? What does this demonstrate about `super`?__

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno
```
Line 277 outputs `#<GoodDog:0x000001e5b336acf0 @name="brown", @color="brown">`. This output shows that `bruno` references a `GoodDog` object and has two instance variables `@name` and `@color` both of which reference a string object `"brown"`. 

The reason for this is the call to `super` on line 271. When `super` is called without any arguments, it invokes a method of the same name earlier in the method lookup path and automatically forwards all the arguments to this method that were passed to the method from which `super` was called.

So the instance variable `@name` and `@color` are initialized to the same string object that was passed to the `::new` method i.e. the string object `"brown"`.
---------------------------

On line 276 the instantiation of a `GoodDog` object using the class method `new` automatically invokes the `GoodDog#initialize` method and passes it as argument the string object `"brown"` where it is assigned to the local variable `color`. 

On line 271, the reserved keyword `super` is called. `super` invokes a method of the same name as the method from which it is called but earlier in the method lookup path which in this case is the `Animal#initialize` method. This is because `GoodDog` directly subclasses from `Animal`. In addition, `super` also forwards all of the arguments to `Animal#initialize` that were passed to `GoodDog#initialize`, which in this case is the string `"brown"`. The `Animal#intialize` method initializes a new instance variable `@name` to this string object `"brown"` and then execution returns to the `GoodDog#initialize` method on line 271. Next, on line 272 the `@color` instance variable is initialized to the same string object `"brown"` that is referenced by `color`.

So the `@name` and `@color` instance variables refernce the same string object `"brown"` so when the `bruno` object is output by `p` method invocation on line 277, the output shows the instance variables `@name` and `@color` both reference the string `"brown"`.

This demonstrates that if `super` is called without any arguments, it automatically forwards all the argument to the method of the same name earlier in the method lookup path.

---------------------------------------------------------------

Line 277 outputs `#<GoodDog:0x000001e5b336acf0 @name="brown", @color="brown">`. This output shows that the `bruno` which is a `GoodDog` object, has two instance variables `@name` and `@color` both of which reference the string object `"brown"`. 

On line 278 we instantiated a new `GoodDog` object by invoking the class method `::new` on the `GoodDog` class and pass in the string `"brown"` as an argument. The `new` method invokes the `initialize` constructor method defined in the `GoodDog` class on lines 270-272 and forwards the arguments to `GoodDog#initialize` as well. So `color` refernces the passed in string `"brown"`. Inside the `initialize` method on line 271 we call `super` which is reserved keyword in Ruby that invokes a method of the same name, that is, `initialize` and that is earlier in the method lookup path. Since `GoodDog` subclasses from `Animal`, Ruby will inspect `Animal` to look for the `initialize` method and invoke it. `super` will also automatically forward all the arguments that were passed to `GoodDog#initialize` to the `Animal#initialize` method. So the string object `"brown"` will be passed to `Animal#initialize` and assigned to `name`. In this method on line 265, the instance variable `@name` for `bruno` object will be initialized to object referenced by`name` local variable which is the string object `"brown"`. 

Next, execution will return to the `GoodDog#initialize` method  on line 271 and then the `@color` instance variable will be initialized to the same string object `"brown"` that is referenced by `color` local variable and `@name` instance variable as well. 

This demonstrates that if `super` is called without any arguments, it automatically forwards all the argument to the method of the same name earlier in the method lookup path. 

__Q9:  What is output and why? What does this demonstrate about `super`?__

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

The above code raises an `ArgumentError`. The reason for this error is the call to `super`  in the `Bear#initialize` method on line 314 . When `super` is called without `()`, it invokes a method of the same name earlier in the method lookup path which in this case is `Animal#initialize` and also forwards all the arguments to this method. But as `Animal#initialize` does not expect any arguments, an `ArgumentError` is raised. 

__Q10:What is the method lookup path used when invoking `#walk` on `good_dog`?__

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

We can find the method lookup path by invoking the `ancestors` method on the class of the `good_dog` object.

```ruby
p GoodAnimals::GoodDog.ancestors
```

The above line outputs: `[GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable, Object, Kernel, BasicObject]`

The output is an array of the classes and modules that Ruby will inspect to search for any methods invoked on an object of `GoodAnimals::GoodDog` class and the order of the search will be from right to left. So first Ruby will look in the `GoodAnimals::GoodDog` class, then `Danceable` module, then `Swimmable` module, then `Animal` class, then `Walkable` module where Ruby will find the `walk` method and execute it. Ruby will not go any further up the method look up path after the method is found.

