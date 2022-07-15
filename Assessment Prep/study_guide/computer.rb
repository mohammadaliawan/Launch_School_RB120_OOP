
# class Computer
#   def initialize(type, model, ram)
#     self.type = type
#     self.model = model
#     self.ram = ram
#   end

#   def info
#     "#{self.type}, #{self.model}, #{ram}"
#   end

#   def upgrade_ram
#     self.ram = "8 GB"
#   end

#   private

#   attr_accessor :type, :model, :ram
# end

# class Laptop < Computer
#   def initialize(model, ram, screen_size)
#     super("laptop", model, ram)
#     @screen_size = screen_size
#   end

#   def info
#     "#{super}, #{screen_size}"
#   end

#   private
#   attr_accessor :screen_size
# end

# home_computer = Laptop.new("Dell Latitude", "4 GB", "15.5 inches")

# p home_computer.info

# home_computer.upgrade_ram

# p home_computer.info

# class Person
#   attr_reader :name
  
#   def set_name
#     @name = 'Bob'
#   end
# end

# bob = Person.new
# p bob.name

# module Swim
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swim

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# teddy.enable_swimming
# p teddy.swim

module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

# p Describable.ancestors

# class Shape
#   def self.sides
#     self::SIDES
#   end
  
#   def sides
#     self.class::SIDES
#   end
# end

# class Quadrilateral < Shape
#   include Describable
#   SIDES = 4
# end

# p Quadrilateral.ancestors

# class Square < Quadrilateral; end

# p Square.sides  # Square < Quadrilateral (Constant) < Shape ()
# p Square.new.sides 
# p Square.new.describe_shape 

# class Computer
#   def initialize(storage)
#     @storage = storage
#   end

#   def get_storage
#     @storage
#   end

# end

# home_computer = Computer.new("350 GB")
# laptop = Computer.new("150 GB")

# p home_computer.get_storage
# p laptop.get_storage 

# class Computer
#   @@total_computers = 0

#   def initialize
#     @@total_computers += 1
#   end

#   def total_computers
#     @@total_computers
#   end

#   def self.total_computers
#     @@total_computers
#   end

# end

# home_computer = Computer.new
# laptop = Computer.new

# p Computer.total_computers
# p laptop.total_computers

# class SomeThing
#   GREETING = "Hello"
# end

# GREETING = "Hello"

# class  Computer
#   def output
#     puts GREETING
#   end
# end

# Computer.new.output

# GREETING = "Hello"

# class Person
#   def greet
#     puts GREETING
#   end
# end

# Person.new.greet

# p Person.ancestors

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark bark #{@name} bark bark"
  end
end

fido = Dog.new("Fido")
puts fido.dog_name