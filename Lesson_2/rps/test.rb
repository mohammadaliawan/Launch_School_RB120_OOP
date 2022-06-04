class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("hi")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi