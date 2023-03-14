# Lesson 3 Quiz

**Q3**

```ruby
str1 = "I am a string"
str2 = str1
```
We can use the `BasicObject#equal?` method for this purpose. This method is inherited by the `String` class and its objects which `str1` and `str2` are. `equal?` method returns `true` if the object calling the method and the object passed in as argument are the same objects as shown below. Otherwise, it return `false`.

```ruby
str1.equal? str2` # => true
```
We can also use the `Object#object_id` method to determine if they are the same object. `object_id` returns the unique object identification number (an `Integer` object) as per its location in memory. If both objects occupy the same location in memory, then they are the same object. As shown below:

```ruby
str1.object_id == str2.object_id # => true
```

**Q4**

```ruby
> str1 = "I am a string"
> str2 = "I am a string"
> p str1
"I am a string"
> p str2
"I am a string"
```

`str1 == str2` will return `true` because `String#==` method compares the length and content of the strings only. That is, if they have the same value, then it returns `true`.

`str1.equal?(str2)` will return `false`. Here we are invoking the `BasicObject#equal?` method. This method returns `true` only if the two strings beings compared are the same object. Here, `str1` and `str2` are different `String` objects but have the same value.

`str1 === str2` will return `true`. Here we are invoking the `String#===` method. This method also returns `true` if the two `String` objects have the same value similarly to `==`.

`(str1 <=> str2) == 0` will return `true`. Here we are invoking the `String#<=>` method that returns the integer `0` if the strings being compared have the same content and length. `0 == 0` will then return `true`.

**Q5**

```ruby
class Thing
  attr_accessor :size

  def initialize(s)
    @size = s
  end

  def ==(other_thing)
    size == other_thing.size
  end
end

thing1 = Thing.new(5)
thing2 = Thing.new(5)
thing3 = thing1
thing1.size = 4

thing1 == thing2

```

On line 54 and 55 two `Thing` objects are created (and assigned to local variables `thing1` and `thing2`) and their instance variables `@size` are initialized to `5`.

On line 57, the `Thing#size=` instance method is invoked on the `thing1` object. This setter method invocation reassigns the `thing1` object's `@size` variable to `4`. 

On line 59, `Thing#==` method is invoked on the `thing1` object and `thing2` is passed as argument and assigned to `other_thing`. On line 50 the `size` and `other_thing.size` are getter method invocations that return the integer objects referenced by the `@size` instance variable for the calling object and the `other_thing` respectively. The `Thing#==` method compares the values of the `@size` instance variableS using the `Integer#==` method.

So line 50 will evaluate to `4 == 5` which will return `false`. So `thing1 == thing2` returns `false`. 


`thing2 == thing3` will return `faLSE`. On line 56, `thing3` local variable was initialized and assigned to the same `Thing` object that `thing1` references. The `@size` variable for `thing3` references `4` as `thing1` and `thing3` reference the same object while `@size` for `thing2` points to `5`. So line 50 will evaluate to `4 == 5` which will return `false`. So `thing2 == thing3` will return `false`.

`thing3.equal? thing2` will return `false` as the two local variables reference two different `Thing` objects. `equal?` method returns true only if the two objects being compared point the same object.

`thing3.equal? thing` will return `true` as the two local variables point to the same `Thing` object.

**Q6**

```ruby
class Circle
  attr_reader :radius

  def initialize(r)
    @radius = r
  end

  def >(other)
    radius > other.radius
  end

  def ==(other)
    radius == other.radius
  end
end

circle1 = Circle.new(5)
circle2 = Circle.new(3)
circle3 = Circle.new(5)

circle1 > circle2
circle2 < circle3
circle1 == circle3
circle3 != circle2
```

On lines 97 and 98, two objects of `Circle` class are created and assigned to the local variables `circle1` and `circle2` and their `@radius` instance variables are initialized to `5` and `3` respectively. 

On line 101 the `Circle#>` method is invoked on the object referecned by `circle1`; the object referenced by `circle2` is passed in as an argument and assigned to the local variable `other` in the `>` method. 

In the `>` method, `radius` and `other.radius` are getter method invocations that return the values for the `@radius` instance variables for the calling object and the object referenced by `other` respectively. The `Circle#>` method uses the `Integer#>` method to compare the values of the two instance variables.

Line 93 evaluates to ` 5 > 3` which returns `true` so `circle1 > circle2` returns `true`.


The `Circle#>` method compares the `@radius` instance variables for the calling object and the object referenced by `other` by utilizing the `Integer#>` method. 

`@radius` for `circle1` is initialized to `5` on line XX and the `@radius` for `circle2` is initialized to `3` on line XX. 

So line XX evaluates to `5 > 4` which return `true` so line X returns `true`.



