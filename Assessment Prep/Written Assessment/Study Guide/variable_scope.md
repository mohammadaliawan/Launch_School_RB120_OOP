# Variable Scope

### Instance Variable Scope

- Instance variables are scoped at the object level.
- They are used to track individual object state.
- They donot crossover between objects
- Because the scope of instance variables is at the object level, it accessible inside the object's instance methods even if it initialized outside the instance method.

__Differences between local variables and instance variables__

- Instance variables are accessible inside instance methods even if they are initialized outside the instance method while local variable are not. Local variables have to be either passed in as arguments or have to be initialized inside instance methods.
- If we try to reference an uninitialized instance variable, Ruby will return `nil`, however if we try to reference an uninitialized local variable Ruby will raise a `NameError` exception. 

### Class Variable Scope

- Class variables are scoped at the class level
- reference to an uninitialized class variable raises a `NameError`
- Class variables are accessible inside instance methods and class methods provided they have been initialized prior to the method invocation.
- Initialization of class variables inside instance methods or class methods is not possible until the method is invoked. 
- all objects share 1 copy of the class variable. This implies that objects can access class variables through instance methods and that any object can manipulate the value of the class variable.
- Only class variables can share state between objects

### Constant Variable Scope

- Constants have lexical scope
- Lexical scope means that where the constant is defined in the source code determines where it is available.
- When Ruby tries to resolve a constant reference, it searches lexically - that is, it searches the surrounding structure of the constant reference. 
- lexical scope: the class and the module the class is in
- If the constant is initialized in the class, it is accessible inside both class methods and instance methods.
- If the constant is initialized in a module that groups related classes for namespacing purposes, then the constant is still accessible inside the class methods and instance methods because it is available lexically. 

- When trying to reference a constant from an unconnected class through, a `NameError` is raised as the class is not part of the lexical search and not included in the constant lookup path. 

- Unlike class and instance variables, we can reach into the another unconnected class and reference a constant defined in that class. We have to tell Ruby where to search for the constant by using the `::` operator. It is called the constant resolution operator.

## Inheritance and Variable Scope

### Instance variables

- Instance variables and their values are not inherited from a superclass or mixin module
- The instance method that initializes the instance variable must first be invoked whether its in a superclass or mixin module. The instance can then access that instance variable.

### Class variables

- If the class variables is initialized in a superclass i.e. we dont need to explicitly invoke a method to initialize it then it is accessible to all subclasses and their objects i.e. it is accessible inside instance methods and class methods. Any of the subclasses or object of these subclasses can change the value of this class variable.
- It is dangerous to work with class variables in the context of inheritance because the superclass and all the subclasses and their objects share one copy of the class variable.

### Constants

Order of Constant Resolution:

- Ruby will resolve a constant by first searching in the lexical scope of the reference i.e. surrounding structure of the constant reference. Lexical scope does not include the main scope
- If that is unsuccessful, Ruby will then traverse up the inheritance hierarchy of the structure that references the constant
- Top level - The top level scope is only searched after Ruby tries the inheritance hierarchy.
