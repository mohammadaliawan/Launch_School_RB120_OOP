# Modules

Modules are one of the ways to achieve polymorphism in Ruby.

A module is a collection of behaviors(instance methods) that is usable in other classes via mixins. A module allows us to group reusable code into one place. Modules are also used as a namespace.

A module is mixed in to a class using the `include` method invocation. 

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

We have mixed in the module `Upgradable` in both classes by invoking the `include` method and passing the name of the module as argument.

Now, the instance methods defined in the `Upgradable` module are now available to all instances of the classes `Laptop` and `Desktop`.