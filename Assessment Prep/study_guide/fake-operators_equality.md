# Fake operators and equality

## Equality

`==`

- for most objects, the == operator compares the values of the objects, and is frequently used.
- the == operator is actually a method. Most built-in Ruby classes, like Array, String, Integer, etc. provide their own == method to specify how to compare objects of those classes.
- by default, BasicObject#== does not perform an equality check; instead, it returns true if two objects are the same object. This is why other classes often provide their own behavior for #==.
- if you need to compare custom objects, you should define the == method.
understanding how this method works is the most important part of this assignment.