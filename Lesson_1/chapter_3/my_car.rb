class Vehicle
  attr_accessor :year, :color, :model, :speed

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
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

  def doors
    puts "#{self.class} has #{self.class::NUMBER_OF_DOORS} doors"
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def age
    puts "Your #{model} is #{years_old} years_old!"
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
end

new_car = MyCar.new(2010, "Blue", "Corrola")
new_truck = MyTruck.new(1992, "Black", "Landcruiser")


new_truck.age