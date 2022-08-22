# How do you find where Ruby will
# look for a method when that method is called?
# How can you find an object's ancestors?

# When a method is called Ruby traverses a method lookup path searching for the method name.
# The method lookup path starts with the class of the calling object. We can check where Ruby
# will search for a method by checking the method lookup path for the class of the calling object.
# The method lookup path consists of the calling class's superclasses and included modules.
# The exact order can be checked by calling the ancestors class method on the calling object's class.

module Taste
  def self.some_method
    puts self
  end

  def flavor(f)
    puts "#{f}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

orange = Orange.new

orange.flavor("sour")

Taste.some_method


