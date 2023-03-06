# Easy 1

__Question4__

```ruby
class AngryCat
  def hiss
    puts "Hiss"
  end
end

puss = AngryCat.new
```

A new instance of class `AngryCat` can be created by invoking the class methos `::new` on the class `AngryCat`. All 
classes in Ruby have this method as it is inherited from the `BasicObject` class that is a superclass of all classes in Ruby. This method will return a new object of class `AngryCat`.

__Question 5__

Which of these two classes would create objects that would have an instance variable and how do you know

```ruby
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end


```
To create a new object from either of the above classes we will need to invoke the class method `new` on each of the classes. `new` triggers and automatically invokes the instance method `initialize` which is defined in both of the above classes. The `Pizza#initialize` method on line 31 is initializing an instance variable `@name` to the value referenced by the local variable `value`. We know that `@name` is an instance variable because it is prepended by the `@` symbol. 

However, the `Fruit#initialize` method is reassigning the `name` local variable back to itself on line 25. So no instance variables will be initialized for the new `Fruit` object that will be created.

We can also check if objects of either classes have instance variables by creating new objects of both classes and invoking the `instance_variables` method on both objects.

```ruby
Pizza.new("Deep pan").instance_variables #=> [:@name]
Fruit.new("Orange").instance_variables #=> []
```

As we can see above, the `Pizza` object has the the instance variable `@name` while the `Fruit` object has no instance variables (empty array is returned).

__Question 6__

You can see in the make_one_year_older method we have used `self`. What does `self` refer to here?

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```

`make_one_year_older` is an instance method that can only be invoked on an instance or object of `Cat` class. Since `self` on line 64 is inside an instance method, `self` here refers to the calling object i.e. the method that invoked the `make_one_year_older` method.

__Question 8__

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
```

On line 83 `self` is used to define a class method, outside of an instance method and inside the class `Cat`, so here `self` refers to the class `Cat`.

__Question 9__

```ruby
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

```

To create a new instance of the class `Bag`, we will need to invoke the class method `new` on the class `Bag` and pass in two arguments.