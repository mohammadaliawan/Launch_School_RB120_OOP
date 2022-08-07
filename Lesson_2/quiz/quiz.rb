class Cat
  @@total_cats = 0
  attr_reader :name

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
    @name
  end
end

mitzi = Cat.new('Mitzi')
p mitzi.jump # => "Mitzi is jumping!"
p Cat.total_cats # => 1
p "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"

=begin
On line `24` the `Cat#jump` method is invoked. The `jump` method returns a string with `name`
interpolated into the string. Here `name` has not been defined as a local variable or as a method
So ruby raises a `NameError`. The intention of interpolating `name` here seems to be that we want to 
use the value for the instance variable `@name` in the string on line `15`. To accomplish this 
we can define a getter method that returns the object referenced by `@name`. To do this we can use
the `attr_reader` method and pass in the symbol :name` as the argument. This is a quick way to 
define a getter method by the name of `name` which returns the instance variable `@name`

On line `25` we are invoking the `Cat` class method `total_cats`. This method returrns the object 
referenced by the class variable `@@total_cats`. The intention of creating a class variable is to track a class
level detail. In this case its the number of `Cat` objects instantiated. To accomplish this we need to increment the
@@total_cats` by 1 each time a new `Cat` object is created. We can do this inside th constructor `initialize` method
which is invoked each time a new `Cat` object is created using the class method `new`.
So adding the line `@@total_cat += 1` will increment `@total_cats` by 1 and `1` will be returned on line `15`.


On line `26` we are interpolating the object referenced by the local variable `mitzi` into the string. `mitzi` 
references a `Cat` object. `#{mitzi}` invokes the `to_s  method on the `mitzi` cat object. Since `to_s` has not been defined in
the class `Cat`, RUby searches the method lookup path for `to_s` method. The `to_s` method is defined in the `Object` 
class. By default the `to_s` method`, return the string representation of the name of the class and an encoding of the
object id like this #<Cat:0x000001bde3133d30>. We need to override the Object#to_s method to return the object referenced by
the `@name` instance variable. So from lines x to x we define a to_s method that return the string referenced by @name
and that string is then interpolated in to the surrunding string.

=end