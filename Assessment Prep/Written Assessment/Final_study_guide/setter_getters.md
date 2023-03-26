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

When `self` is referenced inside an instance method like above, it references the calling object.

## Why is it a good idea to use getters instead of referencing the instance variables directly?

When we dont want to expose the raw data referenced by instance variables, it is a good idea to use getter methods instead because they can be used to return a consistently modified version of the instance variable value. This way sensitive data can be protected. 

Furthermore, any changes to how the data needs to be formatted in the future can be performed in one place and entire code does not need to be modfied thus making the code more maintainable.

## How do you decide whether to reference an instance variable or a getter method?__

If getter methods are available, it is better to invoke the getter method instead of referencing an instance variable directly because, there might be some built-in data protection within the getter method that would be bypassed if the instance variable is referenced directly. Referencing instance variables directly exposes the raw data that these variables reference. Getter methods can be used to return a consistently modified version of the instance variable value and any changes to the formatting can be made in one place making future changes easier.

Likewise, if setter methods are available they should be used to set instance variable values because they could have some form of data validation built into the method that would be bypassed if the instance variable is set directly. Hence, it is better to use the setter methods. 

Below is an example that shows how getter methods can be used to return a consistently modified version of the instance variable value so as not to expose the raw data referenced by the instance variable. A setter method is also defined that incorporates data validation before assigning any value to the instance variable.

**Example:**

```ruby
class Person
  attr_accessor :name, :age
  
  def initialize(name, age, bank_account)
    self.name = name
    self.age = age
    self.bank_account = bank_account
  end

  def bank_account
    "******#{@bank_account[6..9]}"
  end

  def bank_account=(new_account)
    @bank_account = new_account if new_account.size >= 10
  end
end

bob = Person.new("Bob", 48, "0123456789")

p bob.bank_account # ******6789
```

In the above example, we are only displaying the last four digits of the `@bank_account` of a `Person` object when we invoke the getter method `bank_account`. So whereever we need to use the `@bank_account` value we can use the getter method and we will not exposing the complete bank account number of a person.

The setter method `bank_account=` has data validation built into it. It checks if the new value being assigned to the instance variable `@bank_account` is atleast 10 digits.