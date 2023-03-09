# Medium 1

```ruby
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
```

Ben is right because he is invoking the instance method `#balance` that returns the object referenced by the instance variable `@balance`. This instance method is automatically created by the `attr_reader :balance` method invocation on line 5. The instance method `#balance` is known as the getter method for the instance variable `@balance`. And inside the `positive_balance?` instance method he is invoking this getter method `#balance` on the caling object.

__Question 2__

```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
```

In the `update_quantity` instance method on line 32 we are initializing a new local variable `quantity` rather than reassigning the instance variable `@quantity` to the `updated_count`. The intention here was probably to call the setter method for `@quantity` because setter methods are used to reassign or set the values for instance variables. But Ruby interprets line 32 as the initialization of a new local variable. To allow Ruby to disambiguate between initialization of a new local variable and calling the setter method, we need to call the setter method on `self` explicitly. `self` here refers to the calling object and then `#quantity=` will be called on this object. Hence allowing us to reassign the instance variable `@quantity`.

But to use the setter method `quantity=` we need to define it first. So instead of using the `attr_reader` method on line 23, we need to use the `attr_writer` method invocation. This will create the instance method `#quantity=`.

We could also use the `@` symbol prefixed to the `quantity` on line 32 to refer to the instance variable `@quantity`. This is a more direct way of reassigning an instance variable. 

__Question 3__

Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity. Is there anything wrong with fixing it this way?

Fixing this mistake by using `attr_accessor` creates a potential problem of public access to the setter and getter methods for instance variables. This could result in unintentional manipulation of sensitive data because now users of the class and its objects have direct access to referencing and reassigning these instance variables and can circumvent the protections built into the `update_quantity` method.

Instead it would be more appropriate to define the getter and setters as private methods using the `private` access modifier. This way these method would not be part of the public interface of the class and can only be invoked inside the class. And we can define public methods that use these private methods in an appropriate way with some data validation and protection built-in so as not to allow unintentional manipulation of data. 

__Question 4__

```ruby
class Greeting
  def greet(greeting)
    puts greeting
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
```
__QUestion 5__

```ruby
class KrispyKreme
  def initialize(filling_type, glazing)
    self.filling_type = filling_type
    self.glazing = glazing
  end

  def filling_type=(filling_type)
    unless filling_type
      @filling_type = "Plain"
    else
      @filling_type = filling_type
    end
  end

  def glazing=(glazing)
    unless glazing
      @glazing = ''
    else
      @glazing = glazing
    end
  end

  def to_s
    if @glazing.empty?
      @filling_type
    else
      "#{@filling_type} with #{@glazing}"
    end
  end
end
```
__Question 6__

```ruby
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
```

__Question 7__

change `light_status` to just `status`.
