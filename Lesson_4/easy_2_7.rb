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

cat1 = Cat.new("a")
cat2 = Cat.new("b")

p Cat.cats_count #=> 2

=begin
Explain what the @@cats_count variable does and how it works. 
What code would you need to write to test your theory?

`@@cats_count` is a class variable. Class variables are used to keep track of a class level detail i.e.
information that is related to the entire class. 

Here, `@@cats_count` is keeping track of how many `Cat` objects have been instantiated by incrementing
the value of `@@cats_count` by `1` each time a new `Cat` object is instantiated. The way it does this
is that whenever a new `Cat` object will be instantiated using the class method `new`, the `initialize`
method defined on lines `4` to `8` will be invoked. This method increments `@@cats_count` by 1
 on line `7`. `@@cats_count` will be initialized to the integer `0` when the class is evaluated by Ruby.

 We can check this by instantiating a few `Cat` objects and checking the value of `@@cats_count`. 
 The class method `cats_count` can be invoked on the `Cat` class and it will return the integer referenced
 by `@@cats_count`.

 In this case we have instantiated two `Cat` objects `cat1` and `cat2`. This means that `@@cats_count` will be incremented to 2.
So the `Cat.cats_count` method call should return the integer `2`and it does. 



=end