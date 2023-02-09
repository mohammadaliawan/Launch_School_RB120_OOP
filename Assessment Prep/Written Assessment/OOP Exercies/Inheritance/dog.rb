=begin
- create a subclass from Dog called Bulldog
- override the swim method to return "can't swim"

Initially we had a class `Dog` that defined two instance methods
`speak` and `swim`. We created a new class called `Bulldog` that
subclasses from `Dog`. THe class `Bulldog` defines a `swim
method as well. This `Bulldog#swim` method overrides the `Dog#swim`
method as they have the same method name and when this method is invoked
on a `Bulldog` object, Ruby will first inspect the `Bulldog` class
to look for this method definition and finding it in `Bulldog`
it will execute this method. It will not go further up the method
lookup path to the superclass `Dog`. This is why when we invoke the
`swim` method on the `bull` object on line 40, it returns `"can't swim"`
because the `Bulldog#swim` method defined on lines 30 to 32 is invoked.

The `Dog#speak` method is inherited by the `Bulldog` class from its 
superclass `Dog`. So it is available for objects of `Bulldog` class
to invoke. This is why the `bull.speak` method invocation on line 44 returns
`"bark"` the same as line 41 `teddy.speak`

# Create a new class called `Cat
# can do everything that a dog can except swim or fetch
# 

We have created a new class `Cat` but instead of copying all the methods from the `Dog`
class and pasting them in the `Cat` class, we need to do something that will reduce
repetition in our code and would make the code more maintainable. We can accomplish this
by extracting the common methods from the `Cat` and `Dog` classes and moving them to a
superclass called `Pet`. 

We know that the behaviours `speak`, `run` and `jump` are common among the two classes so we 
can move them to the superclass `Pet` and make the `Dog` and `Cat` subclasses of `Pet`.
This way the methods `speak`, `run` and `jump` will be inherited by both `Cat` and `Dog`
classes and so will become available to the `Cat` and `Dog` objects. `swim` and `fetch` 
are behaviours that are specific to the `Dog` objects so we keep them in the `Dog` class.

Although `speak` is common among the `Cat` and `Dog` classes, the return value of these methods
needs to be specific to each class as cats dont speak the way dogs do. So we make the return value
of `Pet#speak` as `"speaking"` to keep it more general but then we override this method with
`Cat#speak` and `Dog#speak` return a value that is more specific to these classes for more fine tuned
behaviour. 
=end

class Pet
  def speak
    'speaking!'
  end

  def run
    "running!"
  end

  def jump
    "jumping!"
  end
end

class Cat < Pet
  def speak
    "meow!"
  end
end

class Dog < Pet
  def speak
    "bark!"
  end

  def swim
    'swimming'
  end

  def fetch
    "fetching!"
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

teddy = Dog.new
# puts teddy.speak
# puts teddy.swim
# puts teddy.run
# puts teddy.jump
# puts teddy.fetch

bull = Bulldog.new
# puts bull.speak
# puts bull.swim
# puts bull.run
# puts bull.jump
# puts bull.fetch


kitty = Cat.new
puts kitty.speak
puts kitty.run
puts kitty.jump
