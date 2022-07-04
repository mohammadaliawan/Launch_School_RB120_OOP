
class Computer
  def initialize(type, model, ram)
    self.type = type
    self.model = model
    self.ram = ram
  end

  def info
    "#{self.type}, #{self.model}, #{ram}"
  end

  def upgrade_ram
    self.ram = "8 GB"
  end

  private

  attr_accessor :type, :model, :ram
end

class Laptop < Computer
  def initialize(model, ram, screen_size)
    super("laptop", model, ram)
    @screen_size = screen_size
  end

  def info
    "#{super}, #{screen_size}"
  end

  private
  attr_accessor :screen_size
end

home_computer = Laptop.new("Dell Latitude", "4 GB", "15.5 inches")

p home_computer.info

home_computer.upgrade_ram

p home_computer.info

