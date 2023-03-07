# Easy 3

__Quesstion 1__

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```

__Case 1__

```ruby
hello = Hello.new
hello.hi # Hello
```

`hello.hi` outputs `Hello`. We have defined a `Greeting` class and two other classes `Hello` and `Goodbye` that are defined as subclasses of `Greeting`. The `Goodbye#greet` method is inherited by both `Hello` and `Goodbye` classes and is available to their objects. On line 29, we are invoking the `Hello#hi` on the object `hello` which is an instance of `Hello` class and created on line 28. The `hi` method invokes the `greet` method and passes in the string `"Hello"` as the argument. The `greet` method outputs the string `"Hello"` and returns `nil`.

__Case 2__

```ruby
hello = Hello.new
hello.bye
```
On line 38 we are invoking an instane method `bye` on an object `hello` of `Hello` class. This will raise a `NoMethodError` as `Hello` does not define a `bye` method. `bye` method is defined in the `Goodbye` class and is not available to the `Hello` class and its objects.

```ruby
hello = Hello.new
hello.greet
```

Line 44 will raise an `ArgumentError` because the `greet` method as defined on lines 7-9 needs one argument. 

```ruby
hello = Hello.new
hello.greet("Goodbye")
```
Line 51 will output the string `Goodbye`

```ruby
Hello.hi
```
On line 56 we are trying to invoke a class method `hi` on the class `Hello`. But the `Hello` class does not define a class method `hi`. It only defines an instance method `hi`. So this line will raise a `NoMethodError`.

__Question 2__

We can define a class method `::hi`.

__Question 3__

```ruby
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
```

how do we create two different instances of this class with separate names and ages?

```ruby
cat1 = AngryCat.new(2, "Puss")
cat2 = AngryCat.new(3, "Tabby")
```

We can create two instances of this class by invoking the class method `new` that all classes have. This method automatically invokes the constructor method `initialize` defined in the `AngryCat` class on lines 68-71. This method initializes the instance variables `@age` and `@name` to the arguments passed into `new` on object creation. Each time we create an object by invoking `new` we pass in seperate arguments to it. And these arguments are assigned to the instance variables `@age` and `@name` for that particular object.

Each object's instance variables `@age` and `@name` will be scoped to that particular object and will be seperate from the other object's instance variables. In other words, `cat1` and `cat2` will have their own copy of these instance variables. This can be checked by invoking the instance methods `age` and `name` on `cat1` and `cat2` as they output the `@age` and `@name` instance variables for the calling object.

__Question 4__

