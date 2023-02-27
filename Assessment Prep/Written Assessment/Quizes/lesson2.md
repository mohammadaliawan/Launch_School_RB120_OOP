__Question 1__

You must make some changes to the above code so that the last three statements return the values shown in the comments. Which of the following changes do you need to make? (You may need to make more than one change).


```ruby
class Cat
  attr_reader :name
  @@total_cats = 0

  def initialize(name)
    @name = name
    @@total_cats += 1
  end

  def jump
    "#{name} is jumping!"
  end

  def self.total_cats
    @@total_cats
  end

  def to_s
    name
  end
end

mitzi = Cat.new('Mitzi')
mitzi.jump # => "Mitzi is jumping!"
Cat.total_cats # => 1
"The cat's name is #{mitzi}" # => "The cat's name is Mitzi"
```
On line 30 we are invoking the `Cat#jump` method on the `mitizi` object. The `#jump` method is invoking the getter method `#name` in the string interpolation. So we need to create a getter method for `@name` which we create using `attr_reader`.

The class method `Cat::total_cats` returns the value for the class variable `@@total_cats` which is intended to track the total number of `Cat` objects created. For `@@total_cats` to be able to track the total number of `Cat` objects, we need to increment it whenever a new `Cat` object is created. So increment `@@total_cats` by 1 in the `initialize` method which gets invoked everytime we create a new `Cat` object using the `::new` method.

On line 32 we are using string interpolation with the `mitzi` object. String interpolation invokes the referenced object's `to_s` method. We need to override the `Object#to_s` method in the `Cat` class by defining it in the `Cat` class to return the `@name` instance variable value. 

__Question 2__

```ruby
class Student
  def initialize(name)
    @name = name
    @grade = nil
  end
end

ade = Student.new('Adewale')
ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```
Which of the following code snippets can you add to the class body so that the above code returns a Student object whose state matches the comment in the last line shown above? Select all that apply.

__Question 3__

```ruby
class Student
  attr_accessor :name, :grade
  # assume that this code includes an appropriate #initialize method
end

jon = Student.new('John', 22)
jon.name # => 'John'
jon.name = 'Jon'
jon.grade = 'B'
jon.grade # => 'B'
```
__Question 4__

```ruby
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
sir_gallant.name # => "Sir Gallant"
sir_gallant.speak # => "Sir Gallant is speaking."
```

__Question 5__

```ruby
class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Thief < Character
  def speak
    "#{name} is whispering..."  
  end
end

sneak = Thief.new("Sneak")
sneak.name # => "Sneak"
sneak.speak # => "Sneak is whispering..."
```

- 
On line 118, we are invoking the `speak` method on the `Thief` object referenced by the local variable `sneak`. The `speak` method is inherited by the `Thief` class from its superclass `Character`. The return value of this inherited `#speak` method is `"Sneak is speaking"`. But we need the return string to be `"Sneak is whispering"`. To accomplish that we need to override the `Character#speak` method with a `Knight#speak` method that returns the desired string. So we have defined a `Knight#speak` method that returns `"Sneak is whispering"`. This is code demonstrates method overriding. Method Overriding occurs when there is a method of the same name defined in the subclass and superclass. So when the method is invoked on an object of the subclass, Ruby first searches the subclass for the method definition and finding it there it executes it and does not go further up the method lookup path to the superclass. This is what happends on line 118.

__Question 6__

```ruby
class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

Sheep.new.speak # => "Sheep says baa!"
Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
Cow.new.speak # => "Cow says mooooooo!"
```

On line 151 we are invoking the `Sheep#speak` method on new `Sheep` object. The `Sheep#speak` method calls `super`. `super` here calls a method of the same name earlier in method lookup path i.e. the `FarmAnimal#speak` method. The return value of this method is then concantenated with the the string `" baa!"`.
`
The `FarmAnimal#speak` method uses `self` inside an instance method.  `self` inside an instance method refers to the calling object i.e. the `Sheep` object and after string interpolation (which invokes the `Object#to_s` method on this calling object) it will return the class name along with an encoding of the object id of the `Sheep` object. However, we need the string interpolation to return the name of the class. The `#class` instance method returns the name of the class of the calling object. And after string interpolation (calling `Object#to_s` on the returned class name) the string `"Sheep says"` is returned by the `FarmAnimal#speak` method to line 135 and this string is conatenated with `" baa!"`.

The same process takes place when the `Lamb#speak` method is invoked on the new `Lamb` object on line 152. First the `Lamb#speak` method calls `super` which calls the `Sheep#speak` method, which in turn calls `super` again. So Ruby goes further up the method lookup path and invokes the `FarmAnimal#speak`. The `self` on line 129 now refers to the `Lamb` calling object. So `self.class` returns `Lamb` and after string interpolation the string `"Lamb says "` is returned to line 135, which is concatnated with the string `" baa!"` and the string `"Lamb says baa!"` is returned to line 141 which is then concatenated with the string `"baaaaaaa!"` and the complete string `"Lamb says baa!baaaaaaa!"` is returned by `Lamb#speak` method.

On line 153 we have instantiated a new `Cow` object and invoked the `speak` method on it. In this case Ruby will invoke the `Cow#speak` method as the calling object is a `Cow` object. 
And the `Cow#speak` method calls `super`. So Ruby will go further up the method lookup path and try to find a method of the same name i.e. `speak`. But as this method is not defined in any of the superclasses of `Cow` class i.e. `Object`, `Kernel` and `BasicObject` it will raise a `NoMethodError`. We need the `Cow#speak` method to return the string `Cow says moooo!`. If we make the `Cow` class inherit from the `FarmAnimal` class, the `Cow` class will have access to the `FarmAnimal#speak` method. So we subclass `Cow` from `FarmAnimal` by adding `< FarmAnimal` to the class definition. So now `super` will invoke the `FarmAnimal#speak` methos which will return the string `Cow says ` and this string will be concatenated with the string `mooooo! . 