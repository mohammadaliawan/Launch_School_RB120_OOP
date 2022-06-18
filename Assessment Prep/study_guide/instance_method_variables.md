# Instance Methods and Instance variables

Instance variables are used to track an indvidual object's state and this state tracks attributes of an object. State comprises of the instance variables associated with each object and their values.

Instance variables are scoped at the instance or object level and are used to keep track of an object's state.

Behaviours are defined as instance methods in a class. These methods are available to each object of the class. So we can say that all objects of a class have shared behavior.

Instance variables keep track of state, and instance methods expose behavior for objects.

Instance variables exist as long as the object instance exists and is one of the ways we tie data to objects.

Instance variables are reponsible for keeping track of information about the state of an object.

Every object's state is unique and instance variables are how we keep track.

All objects of the same class have the same behaviours which are provided by the instance methods defined in the class. But they contain different states.

For Example:

```ruby
class Computer
  def initialize(type,model,ram)
    @type = type
    @model = model
    @ram = ram
  end

  def start
    puts "#{@model} Starting..."
  end
end

dell_notebook = Computer.new("Laptop", "Dell Latitude 1559", "8 GB")

hp_notebook.start

```
In the above example we have defined a class `Computer` and instantiated a new `Computer` object by invoking the class method `new` and passing in three arguments.
The `new` method in turn invokes the instance method `initialize` and passes the arguments through to the `initialize` method where they are assigned to the local variables `type`, `model`and `ram`. The initialize method initializes three instance variables `@type`, `@model`, `@ram` and assigns them to the the three arguments passed to it i.e. `type`, `model`, `ram` respectively. 

In the above example, the three instance variables `@type`, `@model` and `@ram` and their respective values comprise the state of the new `dell_notebook` object. So the state of each `Computer` object tracks the type, model and ram attributes.

And this object can perform the behavior 'start'. This behavior is performed by invoking the instance method `start` on any `Computer` object.


### How does the initialize method work?

`initialize` is an instance method that gets invoked every time we instantiate a new object by invoking the class method `new`. So basically the `new` method triggers the `initialize` method. 

The initialize method is known as a constructor because it builds the object when a new object is instantiated. 