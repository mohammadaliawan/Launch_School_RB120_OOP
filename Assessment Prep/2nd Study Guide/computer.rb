# module Speak
#   def speak(words)
#     puts words
#   end
# end

# class GoodDog
#   include Speak
# end

# class HumanBeing
#   include Speak
# end

# sparky = GoodDog.new
# sparky.speak("Arff!!")
# bob = HumanBeing.new
# bob.speak("Hello")

# class GoodDog
#   def initialize(name)
#     @name = name
#   end
# end

# sparky = GoodDog.new("Sparky")
# fido = GoodDog.new("Fido")

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name} says Arff!!"
  end

  def get_name
    @name
  end
end

sparky = GoodDog.new("Sparky")
# sparky.speak

fido = GoodDog.new("Fido")
# fido.speak

p puts sparky.get_name
p puts fido.get_name
p puts sparky.get_name
p puts fido.get_name