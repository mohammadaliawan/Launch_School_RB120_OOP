
class Computer
  @@class_var = "Hello"
  def initialize(model, ram, storage)
    self.model = model
    self.ram = ram
    self.storage = storage
  end

  def info
    "#{model}, #{ram}, #{storage}"
  end

  def upgrade_ram
    self.ram = "8 GB"
  end

  private

  attr_accessor :model, :ram, :storage
end

class Laptop < Computer
  @@class_var = "Bye"
  def initialize(model, ram, storage, screen_size)
    super model, ram, storage
    self.screen_size = screen_size
  end

  def info
    "#{super}, #{screen_size}"
  end

  def class_var
    @@class_var
  end

  private
  attr_accessor :screen_size
end

home_computer = Laptop.new("Dell Latitude", "4 GB", "350 GB", "13 in")

p home_computer.info

p home_computer.class_var

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

# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{SIDES} sides."
#   end
# end

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

# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def dog_name
#     "bark bark #{@name} bark bark"
#   end
# end

# fido = Dog.new("Fido")
# puts fido.dog_name

# class Computer
# end

# class Person
#   attr_accessor :computer

#   def initialize(name, computer)
#     @name = name
#     @computer = computer
#   end
# end

# computer1 = Computer.new

# jack = Person.new("Jack", computer1)
# puts jack.computer 

# class Animal
#   attr_accessor :name

#   def initialize
#     set_name
#   end
# end

# class Dog < Animal
#   def set_name
#     puts "What is your name?"
#     self.name = gets.chomp
#   end
# end

# dog = Dog.new
# puts dog.name




