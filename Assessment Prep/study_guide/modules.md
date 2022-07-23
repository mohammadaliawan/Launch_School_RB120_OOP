# Modules

A module is a collection of behaviors(instance methods) that is usable in other classes via mixins. Modules are one of the ways to achieve polymorphism in Ruby. A module allows us to group related or common reusable code into one place.

A module must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

```ruby
module Upgradable
  def upgrade_ram
  end

  def upgrade_storage
  end
end

class Laptop
  include Upgradable
end

class Desktop
  include Upgradable
end
```
In the above example, we have two classes `Laptop` and `Desktop`. And we have defined a module `Upgradable` which has two instance method `upgrade_ram` and `upgrade_storage`. 

We have mixed in the module `Upgradable` in both classes by invoking the `include`method and passing the name of the module as argument.

Now, the instance methods defined in the `Upgradable` module are available to all instances of the classes `Laptop` and `Desktop`.

## Namespacing

Namespacing means organizing similar classes under a module.OR Using modules to group related classes.

## Container for methods

Modules can also be used as a container for methods called module methods. This is useful for methods that seem out of place.

 ```ruby
module Mammal
  def self.some_method(num)
    num**2
  end
end
 ```
Module methods can be called directly from the module:

```
value = Mammal.some_method(2)

```
