# Method Access Control

Access Control is about allowing or restricting access to a particular functionality or data in our code base using *access modifiers*.

Method Access Control is about allowing or restricting access to methods defined in a class using access modifiers. It provides a way in Ruby to implement encapsulation i.e. hiding data and functionality defined in a class so that it is not available to the rest of the code. 

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

__Q: What is Method Access Control?__

Method Access Control is about allowing or restricting access to methods defined in a class using access modifiers. It provides a way in Ruby to implement encapsulation i.e. hiding data and functionality defined in a class so that it is not available to the rest of the code. 

__Q: # How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.__

It is implemented through the use of access modifiers `public`, `private` and `protected`. When any of these methods is called in a class, any methods defined under this modifier will become public, private or protected methods respectively. 

**Private** methods are methods that can only be invoked inside the class within another instance method by the current object.

**Public** methods can be called inside as well as outside the class by any object of the class. Public methods make up the public interface of the class and are available everywhere within a program. It is how other classes and objects interact with this class and its objects. Any methods that are defined without the use of access modifiers are public by default.

**Protected** methods behave like private methods in that, they can only be called within the class however, protected methods can also be called by other objects of the same class other than the current object. This allows sharing of data between objects of the same class. 

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