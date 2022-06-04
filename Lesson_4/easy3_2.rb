class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Dodo")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


Hello.greet("Didid")