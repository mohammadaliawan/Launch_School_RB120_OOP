# Method Lookup

Method lookup path describes the order in which Ruby traverses the class hierarchy when a method is invoked to look for the method definition.

The **method lookup path** describes the order in which classes are inspected when a method is called to see how that method is defined.

Whenever a method is invoked, the order in which Ruby searches classes for the method definition is called the method lookup path.

When a method is invoked on an object, ruby first looks for that method definition in the class that the object belongs to. If the method is not found, ruby keeps looking in any modules that are mixed in with the class following which it looks in the superclass of the current class. This continues in an ordered fashion until the method is found or there are no more places to look. 

The Method lookup path ends with the following three classes/modules

```
Object
Kernel
BasicObject
```
**Importance of Method Lookup path**

The method lookup path is important because it determines which method definition ruby will execute in case the same method is defined in the class of the calling object as well as in the superclass or a mixed in module. 

It is important to know what the method lookup path looks like for our class hierarchy. It helps us to avoid accidental method overriding and also helps us determine where each method should go i.e. in the subclass or superclass or maybe a module.

When a method is invoked on an object, ruby first looks for that method definition in the class that the object belongs to. If the method is not found, ruby keeps looking in any modules that are mixed in with the class following which it looks in the superclass of the current class. This continues in an ordered fashion until the method is found or there are no more places to look. 

For a class, we can find the method lookup path that Ruby will follow to find the definition of the method being invoked on any object of that class by invoking the class method `ancestors` on that class.

Class
Included Modules
Superclass
Included Modules
Superclass
Included Modules
Object
Kernel
BasicObject

 