module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color, :current_speed
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @year = year
    self.color = color
    @model = model
    self.current_speed = 0
  end

  def self.quantity
    @@number_of_vehicles
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car is now a shiny #{self.color}"
  end

  def speed_up(s)
    self.current_speed += s
    puts "You accelerate by #{s} mph "
  end

  def brake(b)
    self.current_speed -= b
    puts "You decelerate by #{b} mph"
  end

  def shut_down
    self.current_speed = 0
    puts "Lets park this bad boy!"
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  DRIVE_WHEELS = 2

  def to_s
    "My Car is a #{color}, #{year}, #{model}"
  end
end

class MyTruck < Vehicle
  include Towable
  DRIVE_WHEELS = 4 

  def to_s
    "My Truck is a #{color}, #{year}, #{model}"
  end
end

new_car = MyCar.new(2010, "Red", "Choverlet Nova")

new_truck = MyTruck.new(2010, "Black", " Tesla Optimus")

# p new_truck.can_tow?(15000)

# p Vehicle.ancestors
# p MyCar.ancestors
# p MyTruck.ancestors

p new_car.age

