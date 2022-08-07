require 'pry'

class Parent
  @@value = "Parent"

  def self.value
    # binding.pry
    @@value
  end
end

class Child < Parent
  @@value = "Child"
end

class Child2 < Parent
  @@value = "Child2"
end

p Parent.value

p Child.value