# Instance Methods and Instance Variables

## What are Instance Variables?

- a type of variable that start with the `@` symbol. 
- used to keep track of the state of an object. 
- scoped at the object level.
- one of the ways we tie data to objects. 
- exist as long as the object instance exists. 
- cannot cross over between objects
- All objects of the same class have the same behaviours but contain different states
- Every object's state is unique and instance variables are how we keep track.
- state comprises of the instance variables and their values
- uninitialized instance variables return nil

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
fido = GoodDog.new("Fido")
```

In the above example, on line 12 we instantiate a new `GoodDog` Object by invoking the class method `new` on the `GoodDog` class and passing in the string object `"Sparky"`. The `new` method returns a new `GoodDog` object and also invokes the instance method `initialize`. The arguments passed to the `new` method are passed on to the `initialize` method in this case the string object `"Sparky"` and is assigned to the local variable `name` which is defined as the parameter for the `initialize` method. 

In the `initialize` method, the instance variable `@name` is initialized and assigned to the same object that `name` points to i.e. the string `"Sparky"`.

The same thing happens when we instantiate another `GoodDog` object `fido` on line 13. Except in this case the `@name` instance variable for the `fido` object references the string object `"Fido"`, the argument that was passed to the `new ` method invocation on line 13. Both `fido` and `sparky` are `GoodDog` objects, but they contain different information. This information, in this case the name of the object, is tracked by the `@name`instance variables for both `fido` and `sparky`. The `@name` instance variable for the `fido` object is different than the `@name` instance variable for the `sparky` object. Every object's state is distinct, and instance variables are how we keep track.

## Instance Methods

- Behaviours are defined as instance methods
- shared by all objects of a class
- instance variables are accessible inside instance methods even if initialized outside the instance method because they are scoped at the object level
- an objects instance variables are accessible inside instance methods
- instance methods can be used to expose information about the state of an object. 

Instance methods are used to perform behaviours and expose information about the state of an object. 

Classes define the behaviours as instance methods and all objects of the class can invoke these methods. 

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name} says Arff!!"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak

fido = GoodDog.new("Fido")
fido.speak
```


