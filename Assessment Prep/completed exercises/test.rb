class Someclass
  @@var = 4

  def self.cmethod
    @@var = 1
  end

  def somemethod
    @@var = 2
  end

  def self.cvar
    @@var
  end
end

p Someclass.cvar
Someclass.new.somemethod
p Someclass.cvar
Someclass.cmethod
p Someclass.cvar
