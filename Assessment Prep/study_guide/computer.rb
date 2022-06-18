
class Computer
  def initialize(type, model, ram)
    self.type = type
    self.model = model
    self.ram = ram
  end

  def info
    "#{type}, #{model}, #{ram}"
  end

  def upgrade_ram
    self.ram = "8 GB"
  end

  private

  attr_accessor :type, :model, :ram
end

home_computer = Computer.new("laptop", "Dell Latitude", "4 GB")

p home_computer.info

home_computer.upgrade_ram

p home_computer.ram
