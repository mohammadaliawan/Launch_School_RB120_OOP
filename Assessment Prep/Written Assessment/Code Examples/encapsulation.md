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