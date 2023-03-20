# Accessor Methods: Getter and Setter Methods

Accessor methods are used to expose or change information about the state of an object.

## Getter Methods

Getter methods are instance methods which are used to expose information about the state of an object. As state is tracked by instance variables, getter methods return the values for the instance variables.

Getter methods can be created by invoking the attribute accessor method`attr_reader` and passing in the symbols for the names of the getter methods that we want to create.

```ruby
class Computer
  attr_reader :type, :model, :ram
  attr_writer :type, :model, :ram

  def initialize(type,model,ram)
    @type = type
    @model = model
    @ram = ram
  end
end

dell_notebook = Computer.new("Laptop", "Dell Latitude 1559", "8 GB")

p dell_notebook.model # returns "Dell Latitude 1559"

```

In the above example, we have three instance variables `@type`, `@model`. `@ram` associated with each `Computer` object. The `attr_reader` method invocation will create three instance methods `type`, `model` and `ram` which will return the values for these three instance variables respectively. 

On the last line, we invoke the instance method `#model` on the `dell_notebook` object and it returns the values associated with the instance variable `@model`

## Setter Methods

Setter methods are instance methods which are used to change information about the state of an object. As state is tracked by instance variables, setter methods change the values referenced by these instance variables.

Setter Methods are created by invoking the attribute accessor method `attr_writer` and passing in the symbols for the names of the setter methods we want to create.



```ruby
class Computer
  attr_reader :type, :model, :ram
  attr_writer :type, :model, :ram

  def initialize(type,model,ram)
    @type = type
    @model = model
    @ram = ram
  end
end

dell_notebook = Computer.new("Laptop", "Dell Latitude 1559", "8 GB")

dell_notebook.model = "Dell Latitude 2110"

p dell_notebook.model # "Dell Latitude 2110"

```

In the above example, we have three instance variables `@type`, `@model`. `@ram` associated with each `Computer` object. The `attr_writer` method invocation will create three instance methods `type=`, `model=` and `ram=`.

On the last line, we invoke the instance method `#model=` on the `dell_notebook` object and pass the string object `"Dell Latitude 2110"` as an argument. The setter method `model=` assigns the new string object `"Dell Latitude 2110"` to the instance variable `@model`.

## How should setter methods be called inside the class?

If we want to refer to the setter methods inside the class, we cannot just do `model = m`. Ruby interprets that as the intialization of a new local variable `model`. Instead we need to invoke the setter method with the keyword `self`that is `self.model = m`.

When `self` is referenced inside an instance method like above, it references the current object.

## Why is it a good idea to use getters instead of referencing the instance variables directly?

When we dont want to expose the raw data referenced by instance variables, it is a good idea to use getter methods instead because they can be used to return a consistently modified version of the instance variable value. This way sensitive data can be protected. 

Furthermore, any changes to how the data needs to be formatted in the future can be performed in one place and entire code does not need to be modfied this making the code more flexible.

**Example:**

```ruby
class Person
  def initialize(first_name, middle_name, last_name)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

bob = Person.new("Bob", "Pickles", "Brown")

puts bob.name
```