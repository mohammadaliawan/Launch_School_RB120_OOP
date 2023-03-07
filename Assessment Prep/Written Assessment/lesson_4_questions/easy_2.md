# Easy 2

__Question 1__

```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future
```

`predict_the_future` is an instance method that returns a string which is the result of concatenating `"You will "` and the returned string from the method invocations `choices.sample`. `choices` returns an array of strings and `sample` is invoked on this array and `sample` returns one of these strings at random. This random string is contenated with the `"You will "` and the resulting string is returned by the method `predict_the_future`.

__Question 2__

```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future
```

On line 42 we are invoking the instance method `predict_the_future` on the `trip` object which is an object of `RoadTrip` class. This instance method is inherited by the `RoadTrip` class from the `Oracle` class and is available to its objects. This method invokes the `choices` method but this time the `RoadTrip#choices` method is invoked as this method overrides the `choices` method defined in the `Oracle` class. `RoadTrip#choice` returns an array of strings on which `sample` is invoked. `sample` will return a string at random from this array and this string will be concatanated with the string `"You will "` and the resulting string will be returned by the `predict_the_future` method.

__Question 3__

How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

When a method is invoked on an object, Ruby looks for the method definition according to a method lookup path. Method lookup path is the order in which Ruby will inspect classes to look for the method definition. We can find out the method lookup path by calling the `ancestors` method on the class of the object that is invoking the said method.

```ruby
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
```

__Question 4__

```ruby
class BeesWax
  attr_accessors :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
```

__Question 6__

```ruby
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
```

`::manufacturer` is a class method. We know this because class methods are defined on the class by prepending `self` to the class name. Here `self` refers to the class `Television`. Class methods are invoked on the class like this `Television.manufacturer`. 

__Question 7__

```ruby
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.new("puss")
Cat.new("Black")

p Cat.cats_count # outputs 2
```

`@@cats_count` is a class variable. Class variables are used to track a class level detail. In `Cat` class it is being used to track the number of `Cat` objects created. `@@cats_count` is initialized to `0` when the `Cat` class is loaded. And when any new object of `Cat` is created using the `::new` method, it automatically triggers and invokes the instance method `#initialize` defined on 107-111. And this method, in addition to initializing some instance variables, also increments the `@@cats_count` variable by 1 on line 119. Hence, it keeps track of how many `Cat` objects have been created.

We can test this by outputing the value for `@@cats_count` before creating a few `Cat` objects using the `new` method and then outputting the value for `@@cats_count` again after creating these objects. The value for `@@cats_count` can be checked by invoking the class method `::cats_count` which returns the value for this class variable.

__Question 8__

```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```

__Question 9__

```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```
What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

The `Bingo#play` method would override the `Game#play` method. Method overriding occurs when we have a method in a subclass (`Bingo` in this case) that has the same name as a method in it's superclass (`Game` in this case).

When the `play` method is invoked on object of `Bingo`, Ruby first looks for that method in the subclass `Bingo`. And as it finds a method with that name, it executes that method. It does not go looking further up the method look up path in the superclass `Game`. This is called method overriding.

__Question 10__

What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

- makes code more maintainable, flexible and easier to think about
- gives us the ability to write organized code with clear boundaries 
- helps to section off areas of code, restricting access to some parts providing data protection and security
- creates another layer of abstraction for the programmer to think on which helps with solving the problem