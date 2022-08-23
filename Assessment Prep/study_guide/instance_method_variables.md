# Instance Methods and Instance variables

## Instance variables

- track an individual object's state, tie data to objects
- state is unique
- exist as long as the object exists
- state comprises of the instance variables and their values
- scoped at the object level
- cannot cross over between objects
- All objects of the same class have the same behaviours but contain different states
- uninitialized instance variables return nil

Instance variables are used to track an individual object's state.

State comprises of the instance variables associated with each object and their values.

Instance variables exist as long as the object instance exists and is one of the ways we tie data to objects.

Instance variables are scoped at the instance or object level.

<!-- Instance variables are reponsible for keeping track of information about the state of an object.
 -->
Every object's state is distinct, and instance variables are how we keep track.

We can expose information about the state of the object using instance methods.

All objects of the same class have the same behaviours which are provided by the instance methods defined in the class. But they contain different states.

**Every object's state is distinct.**

## Instance Methods

- Behaviours are defined as instance methods
- shared by all objects of a class
- instance variables are accessible inside instance methods even if initialized outside the instance method because they are scoped at the object level
- 

Behaviours are defined as instance methods in a class and expose behavior for objects. These methods are available to each object of the class. So we can say that all objects of a class have shared behavior.

All objects of the same class have the same behaviors, though they contain different states.

Because the scope of instance variables is at the object level, this means that instance variables are accessible in an object's instance methods even if it is initialized outside that method.

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

dell_notebook.start

```
In the above example we have defined a class `Computer` and instantiated a new `Computer` object by invoking the class method `new` and passing in three arguments.
The `new` method in turn invokes the instance method `initialize` and passes the arguments through to the `initialize` method where they are assigned to the local variables `type`, `model`and `ram`. The initialize method initializes three instance variables `@type`, `@model`, `@ram` and assigns them to the the three arguments passed to it i.e. `type`, `model`, `ram` respectively. 

In the above example, the three instance variables `@type`, `@model` and `@ram` and their respective values comprise the state of the new `dell_notebook` object. So the state of each `Computer` object tracks the type, model and ram attributes.

And this object can perform the behavior 'start'. This behavior is performed by invoking the instance method `start` on any `Computer` object.