# Practice Problems

## Object Oriented Programming

### What is Object Oriented Programming and why is it important?

Object Oriented Programming is a programming paradigm. It is a way of structuring and organizing code to make it more maintainable, flexible and easier to think about. 

It was created to deal with the increasing complexity of software programs. As software systems grew larger and more complex it became very difficult to maintain them and make changes. 

OOP solves these problems by creating containers for data and functionality called objects which form the building blocks for the entire program.

These building blocks are independent of each other. Manipulating one object does not affect other objects.The entire program becomes the interaction of these objects. It is even possible to reuse these objects for other purposes which reduces repetition within the program.

OOP gives us the ability write organized code with clear boundaries. Its gives us the ability to section off areas of code, restricting access to data providing data protection and security.

It also creates another layer of abstraction for the programmer to think on which helps with comming up with a more flexibles solution. 

## Encapsulation

### What is encapsulation? How does Ruby implement it? Why is it used?

In general terms, encapsulation is the hiding of or restricting access to some data and functionality in a program, making it unavailable to rest of the code base.

Ruby implements encapsulation by creating objects that have some hidden attributes and behaviours and exposing only those methods and properties through the object's public interface that users of the object need to interact with this object.

Encapsulation is used as a form of data protection so that data cannot be manipulated without explicit intention. It also helps to define boundaries within our program and introduces a new layer of abstraction in a program in the way that the implementation details of a class and its associated behaviour are abstracted away from the programmer.

**Example**

```ruby
class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  private

  attr_accessor :author, :title
end

book1 = Book.new("J.K. Rowling", "Harry Potter")
book2 = Book.new("Tolkien", "The Hobbit")
```
In the above example. the objects `book1` and `book2` are both objects of class `Book` and each of them have the attributes author and title. These attributes are tracked by the state of each object. These states for each object are unique and independent of each other. This state for each object is tracked by the instance variables `@author` and `@title`. Both `book1` and `book2` have their own copy of these instance variables. With the above code, it is not possible to access the state of these `book1` and `book2` objects outside the object i.e. it is not possible to access the instance variables `@author` and `@title` because The getter and setter methods for these instance variables are private methods. Hence, the state of each of these objects is encapsulated within the object with no way to access it outside the object. 

Furthoremore, it is not possible for `book1` object to access `book2` object's instance variables. So, again we can see that there are clear boundaries within our program. This is encapsulation.

However, we can define public methods (`show_author` and `show_title`) that can be used to expose these attributes to rest of the program but in a controlled way so that data is protected from unintentional manipulation. These methods return a copy of the values for `@author` and `@title`. These implementation details are hidden within the class. 

We can also define public methods that can change the attributes of these objects. Below, we have defined the `change_author` and `change_title` methods. These methods use the private methods `author=` and `title=` to change the values assigned to these instance variables. However, this is still done in a controlled way by first capitalizing the input and then assigning it to the instance variables. These implementation details are hidden within the class.

By keeping the getter and setter methods private and only exposing certain methods that control the way the state of each object is accessed, we are using encapsulation to restrict access to data and functionality from the rest of the program hence protecting data from unitentional manipulation and providing a layer of abstraction between the public interface and implementaition details.

```ruby
class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  def show_author
    author.clone
  end

  def show_title
    title.clone
  end

  def change_author(new_author)
    self.author = new_author.capitalize
  end

  def change_title(new_title)
  self.title = new_title.capitalize
  end

  private

  attr_accessor :author, :title
end

book1 = Book.new("J.K. Rowling", "Harry Potter")
book2 = Book.new("Tolkien", "The Hobbit")

book1.author # J.K. Rowling
book2.author # Tolkien

book1.title # Harry Potter
book2.title # The Hobbit
```

### How does encapsulation relate to the public interface of a class?

The methods and properties which are encapsulated within an object are exposed to the outside through the public interface of a class i.e. its public methods. The public interface of a class defines how we interact with the data encapsulated within an object.

### 
