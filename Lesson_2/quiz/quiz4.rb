class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name # => "Sir Gallant"
p sir_gallant.speak # => "Sir Gallant is speaking."

=begin
In the above code we have created two classes `Character` and `Knight`. `Knight` subclasses from `Character`. So `Knight` inherits all behaviours or methods 
from `Character` class except the getter method `name` which it overrides with its own `name` method defined on line `14`. 
On line `19` we instantiate a new `Knight` object by invoking the `new` class method on the `Knight` class and passing in the string argument `"Gallant"`
This object is assigned to the local variable `sir_gallant`. The `new` method invokes the instance method `initialize` and passes the `"Gallant"` argument onto
the `initialize` method. The `initialize` method initializes the `@name` instance variable associated with the `sir_gallant` object to the string `"Gallant"`.

On line `20` we invoke the `name` method on the `sir_gallant` object. Since the `Character#name` method which was created by the `attr_accessor :name` line, 
has been overridden by the `name` method defined on line `14`, the `Knight#name` method is invoked on line `20`. This method further invokes the `super` method 
without any arguments. The `super` method invokes a method with the same name but that higher up in the method lookup path. In this case, it invokes the getter
method `name` from the `Character` class. The `Character#name` method simply return the string object referenced by the `@name` instance variable which in this case
is the string `"Gallant"`. So super returns the string object `"Gallant"` which gets concatenated with the string `"Sir "` and so `name` returns the string
"Sir Gallant"`

On line `21` we invoke the `speak` method on the `sir_gallant` object. The speak method is not defined in the `Knight` class. It is inherited from the `Character`
class. The `speak` method interpolates the return value of '#{@name}' which references the string `"Gallant"` with the surrounding string and returns the string
But we need the output "Sir Gallant ...". To accomplish this, we need to invoke the `Knight#name` method which will return the strign `"Sir Gallant"` as seen above.
So we need to remove the `@` symbol prepended to `@name` so this becomes a method call instead of a refernce to an instance variable. 

Why are we able to invoke the `name` method from `Knight` rather than the `name` getter method from `Character`?
The calling object for the `speak` method is a `Knight` object `sir_gallant`. On line `9` when we are invoking the `name` method inside the string interpolation
This method is actually being called by `self` i.e. it is actually `self.name` but ruby allows us to just write `name`. `self` inside an instance mehtod refers to the
calling object which in this case in the `sir_gallant` object which is a `Knight` object. So on `9` the calling object's `name` method is invoked.
--------------------------------------------------------------------------------------------------------------------------------------------------------------

On line `21` we invoke the `speak` method on the `sir_gallant` object. The speak method is not defined in the `Knight` class. It is inherited from the `Character`
class. The `speak` method interpolates the return value of '#{@name}' which references the string `"Gallant"` with the surrounding string and returns the string
But we need the output "Sir Gallant ...". To accomplish this, we need to invoke the `Knight#name` method which will return the strign `"Sir Gallant"` as seen above.
So we need to remove the `@` symbol prepended to `@name` so this becomes a method call instead of a refernce to an instance variable. 


=end
