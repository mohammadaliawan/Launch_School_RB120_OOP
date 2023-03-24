# Method Access Control

Access Control is about allowing or restricting access to a particular functionality or data in our code base using *access modifiers*.

**Method Access control** is about restricting access to methods defined in a class. Method access control is implemented through the use of access modifiers `public`, `private`, `protected`.

It is implemented through the use of access modifiers `public`, `private` and `protected`. When any of these methods is called in a class, any methods defined under this modifier will become public, private or protected methods respectively. 

Private methods are methods that can only be invoked inside the class within another instance method by the current object.

Public methods can be called inside as well as outside the class by any object of the class. Public methods make up the public interface of the class and are available everywhere within a program. It is how other classes and objects interact with this class and its objects. Any methods that are defined without the use of access modifiers are public by default.

Protected methods behave like private methods in that, they can only be called within the class however, protected methods can also be called by other objects of the same class other than the current object. This allows sharing of data between objects of the same class. 

## Public Methods

Public methods: Class's Interface : How other classes and objects interact with this class and its objects.

Public methods are methods that are available for use to anyone who knows either the class name or object name. These methods are readily available for the rest of the program to use and comprise the class's interface.

All methods are public by default.

## Private methods

Methods that are performing some function inside a class but dont need to be available to rest of the program can be defined as private methods in a class.

We can call the `private` method and any methods defined below the `private` method call is `private`. 

`private` methods are only accessible from other methods in the class. They are not accessible outside of the class definition at all. 

We can only call private methods with the current object using `self`. They cannot be called with any other object even one of the same type.

## Protected Methods

Like `private` methods, `protected` methods can only be called from within the class definition. However, unlike `private` methods, `protected` methods allow access between class instances i.e. other instances of the class or subclass can also invoke the method.

When a method is `private`, the method can only be invoked on `self`. However, when a method is `protected`, instances of the class or a subclass can also call the method. This means we can easily share sensitive data between instances of the same class type.

```ruby
class Person

def older?(other_person)
    age > other_person.age
end
end
```

Example:

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