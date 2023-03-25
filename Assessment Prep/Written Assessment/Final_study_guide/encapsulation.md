# Enacapsulation

## What is encapsulation?  

In general, encapsulation is the act of hiding or restricting access to some data and functionality in a program making it unavailable to rest of the codebase.

In Ruby, it is implemented through the creation of objects and exposing interfaces to interact with those objects.

When objects are created in Ruby, by default they hide or restrict access to their own internal representation i.e. their own state and certain behaviours from the rest of the program. They expose only those behaviours and attributes that users of the object need through their public interace.

It means first that the attributes and methods of an object are associated specifically with that object, or bundled with it; second, it means that the scope of those attributes and methods is by default the object itself.

- Encapsulation of data: Objects encapsulate their own state i.e. instance variables are private by default
- Encapsulation of behaviour: Pulic methods defined in a class can be accessed only by objects of that class or a subclass, they cannot be accessed by other classes or their objects
- Encapsulation of behaviour: private methods can only be accessed within the class by the current object, they are not even accessible by objects of that class outside the class.


### What purpose does it serve in Object Oriented Programming?

It is a form of **data protection** so that data cannot be manipulated without explicit intention.

It also helps define the boundaries within our program.

It also provides a new layer of abstraction.

### How does Ruby achieve this?

Ruby accomplishes this by creating **objects** and exposing **interfaces** to interact with those objects.

Method access control can be used to expose these properties and methods through the public interface of a class i.e. its public methods.

### What are the benefits of encapsulation?

We can interact with an object using its public interface without needing to know the internal implementations of the behaviours of the object.

Another benefit of creating objects is that it allows us to think on a new level of abstraction as objects can represent real world nouns and can be provided with methods that represent behaviours that we are trying to model.

### What is encapsulation? How does Ruby implement it? Why is it used?

In general terms, encapsulation is the hiding of or restricting access to some data and functionality in a program.

Ruby implements encapsulation by creating objects that have some hidden attributes and behaviours and exposing only those attributes and behaviours through the object's public interface that users of the object need to interact with this object.

Encapsulation helps with data protection so that data cannot be manipulated without explicit intention. It also helps to define boundaries within our program and introduces a new layer of abstraction in a program in the way that the implementation details of a class and its associated behaviours are abstracted away from the programmer.

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

__Q: How do objects and classes exhibit encapsulation. Provide an example of both.__

Encapsulation is the act of hiding or restricting access to data and functionality in a program.

In OOP, objects have some data tied to them known as the state of that object. This data is hidden from the rest of the program i.e. encapsulated within the object, with only the objects having access to this data. This state of an object is tracked by instance variables and each object has access to its own instance variables only. That is, instance variables are scoped at the object level. Hence, objects encapsulate their own states in the form of instance variables.

On the other hand, classes (from which objects are created) define certain behaviours for their objects in the form of instance methods. Some of these instance methods are hidden from the rest of the program while some are made public i.e are available to the users of the class. These methods form the public interface of the class. The instance methods that are hidden are private methods and contain implementation details for the public methods. These private methods can only be invoked inside the class. These private instance methods are said to be encapsulated within the class i.e hidden from the rest of the program while public methods are exposed to the rest of the program. Hence, classes encapsulate i.e hides certain behaviours and expose i.e make public certain behaviours that form the public interface of the class.