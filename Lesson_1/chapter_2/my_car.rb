# Create a class called MyCar. 
# When you initialize a new instance or object of the class, 
# allow the user to define some instance variables that tell us the year, 
# color, and model of the car.

# Create an instance variable that is set to 0
# during instantiation of the object to track the current speed of the car 
# as well. 
# Create instance methods that allow the car to speed up, brake, 
# and shut the car off.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(speed_increment)
    @speed += speed_increment
    puts "You have accelerated and now your speed is #{@speed}"
  end

  def brake(speed_decrement)
    @speed -= speed_decrement
    puts "You have decelerated and now your speed is #{@speed}"
  end

  def shut_off
    @speed = 0
    puts "Lets park this bad boy!"
  end
end

corrola = MyCar.new(1992, 'Toyota Corrola', "White")
corrola.speed_up(20)
p corrola.speed
corrola.brake(10)
p corrola.speed
corrola.shut_off