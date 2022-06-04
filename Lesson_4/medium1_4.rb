class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

end

class GoodBye < Greeting
  def bye
    greet("Goodbye")
  end

end