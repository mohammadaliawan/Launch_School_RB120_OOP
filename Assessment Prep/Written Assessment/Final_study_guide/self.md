# `self`

`self` is a way of being explicit about what our intentions are. 

What `self` references changes depending on the scope it is used in.

## Use cases for `self`

1. Use `self` when calling setter method from within the class to differentiate between initializing a local variable and calling a setter method.

From within the class when an instance method uses `self` it references the calling object.

`self` inside of an instance method references the instance (object) that called the method - the calling object. 

2. Use `self` for class method definitions.

Using `self` within a class but outside an instance method refers to the class itself.

Therefore, a method definition prefixed with self is the same as defining the method on the class. That is, `def self.a_method` is equivalent to `def GoodDog.a_method`. That's why it's a class method; it's actually being defined on the class.


### Example of first use case

  ```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end

```

In the above code Ruby interprets lines `12`, `13` and `14` as local variable initialization instead of setter method calls. 

To invoke the setter methods we need to invoke them by prepending `self.` to the method invocations. This is because inside instance methods `self` represents the calling object(current object). This way Ruby interprets `self.name = n` as the `name=` method call on the calling object. 