# Create a class called MyCar. 
# When you initialize a new instance or object of the class, 
# allow the user to define some instance variables that tell us the year, 
# color, and model of the car. Create an instance variable that is set to 0
# during instantiation of the object to track the current speed of the car 
# as well. Create instance methods that allow the car to speed up, brake, 
# and shut the car off.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car is now a shiny #{self.color}"
  end

  def current_speed
    puts "You are now going at #{@current_speed} mph."
  end

  def speed_up(s)
    @current_speed += s
    puts "You accelerate by #{s} mph "
  end

  def brake(b)
    @current_speed-= b
    puts "You decelerate by #{b} mph"
  end

  def shut_down
    @current_speed = 0
    puts "Lets park this bad boy!"
  end
end

lumina = MyCar.new(1997, "white", "chevy lumina")
# lumina.current_speed
# lumina.speed_up(50)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# lumina.current_speed

lumina.color = "black"
puts lumina.color
puts lumina.year