module Walkable
  def walk
    puts "Lets go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is #{name}"
  end

end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk


=begin
To instantiate a new Cat object, we use the class 
method ::new. This method returns a new instance of the
 class it was invoked upon.

#initialize is useful for setting up -- initializing -- 
an object so the object is ready for immediate use.

Instance variables are variables that exist only within an object instance. They are available to 
reference only once the object has been initialized. 

The instance variable is now 
available to reference anywhere inside the object.

Instance methods are written the same as any other method,
 except they're only available when there's an instance of 
 the class.

the instance variable, @name, 
can be accessed anywhere in the object

=end