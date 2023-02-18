# Objective-C for Swift Developers

## Module 1 - Introduction

### Swift and Objective-C similarities:
- Same interface for iOS Frameworks
- Reuse of design patterns

### Swift and Objective-C differences:
- no optional in objective-c because everything can be nil
- no null pointer exception like in jave
    - (!) implications in debugging when no error is thrown 

    #### - Mutability
    - (*) read about object mutability in objective-c
    - objects are mutable by default, except when they're collecitons of certain type
    - objective-c favors reference type and swift do so for value type.

    #### - Typing
    - obj-c is statically AND dinamically typed.
        - Majority of object types are declared in compile time;
        - but some has type ID, which stands that some more meaningfull type should be decalred at runtime.
            - arrays are ID typed.
            - (*) read about method resolution in obj-c
            - (*) read about method swizzling

## Module 2 - Writting Classes

While Swift uses multiple structures to bundle data and functions, such as Classes, Structs and Enums, Obj-c focuses primarily on Classes.

- Every class is associated with 2 files. A header (.h) and an implementation file (.m).
    - .h represents the public interface. 
    - .m contains all the implementation and private methods and attributes.

- All obj-c classes descent from NSObject.
    - (*) What is NSObject, what methods does it contain? Learn about it.

### Declarations:

- Class
    ```
    @interface <Name>: Parent
    @end
    ```

- Properties and Methods
    `@property (nonatomic) NSString *address` when pointers
    `@property (nonatomic) int numberOfbedrooms` when primitives

(*) what are the primitive types in obj-c?

- (*) what are nonatomic attribute means in obj-c?
    - Properties can be either atomic or nonatomic. This distinction relates to how they're handled in multi-threading [1]. The vast majority of properties will be nonatomic - acording to the author. The default is atomic, so you need to write `(nonatomic)` almost every time a new property is declared.

- Other properties attributes might include: readwrite, readonly and copy.
    - readwrite means a property can be readen and written in a given scope. 
    - readonly means a property can only be read -> similar to constant and getters;
    - copy means that a value, and not a pointer, will be passed to given attribute. So it protects the attributes values from changes in other pointers.`
- (!) Same properties can have different attributes in different scopes. Ex:
    ````
    // in House.h
    @interface House: NSObject
        @property (nonatomic, readonly) int numberOfBedrooms;
    @end
    ````
    ````
    // in House.m
    @interface House() 
        @property (nonatomic, readwrite) int numberOfBedrooms;
    @end
    ````

- All obj-c classes inherit a initializer from NSObject. So, unlike Swift, is not always necessary to write custom initializers.

- To create an instance, use: `[[<Object> alloc] init]`

- the default syntax of a method definition in obj-c is: 
`-(returnType) methodName:(parameterType*)parameterName {}`
    - (!) this sintax favor monads declarations.

- in initialization, call `self = [super init]` and check wheter self is not null.

- to access a property of a class, use `_` like in `_address`;

- (?) `[String copy]` is necesary even when object has copy as attribute?;

- `Self` is a pointer to the current class - class at hand. (*) learn more about it.

- (?) `instancetype` is short-hand for declaring the class type, apparently. Does it also work with the full type definition, like `House`.

- What is a designated initializer? The designated initializer guarantees that an object is fully initialized by send an init request to the super class. [2]

- (?) What is the difference between `@interface` and `@implementation`

- Create a `Cocoa Class` class, to bundle .h and .m creation.

- All enum in obj-c are of type Int. They're created with NS_ENUM Macro:
````
typedef NS_ENUM(NSInteger, <EnumName>) {
    value1,
    value2
};
````

- Strength Reference types: Weak and Strong.
    - properties are strong by default.
    - use weak and strong to avoid memory cycles, and leaks.
    - (*) - [3] - links to understand Memory management in obj-c.


## Module 3 - Adding Functions to classes

- Whats the difference between `-` and `+`? `-` means a method is an instace method.

syntax for multiple parameter:
`````
- (returnType)methodName:(p1Type*) p1Name
              moMethodName:(p2Type*) p2Name {}

// * in parameters indicate wheter value is a pointer or not. Only needed when they're.
`````

### Calling methods

- In object-c, instead of saying a method was called, it's said a message was sent. 
  Signature: `[receiver message: argument?]`, like in `[Object alloc]`

- Why do the expression "Sending a message" is used?
    - because a method invocation is not bounded to any particular instance method in compile time, like in swift. In runtime, every time a method gets executed, another method called `objc_sendMessage()` is called in NSObject, and the binding to an specific instance method is made. 
    - (*)(P!) study more about Message Dispatch in Object-C. Maybe it's the only way.

- `dot syntax` works to access properties.
- getters and setters are generated automatically, just like Swift.

### Switch statements

- Very limited. Can only take integer as comparisson.  All conditions must have break and default is required.

- sintax:
```
switch (integer) {
    case 0:
        statement;
        break;
    case 1:
        statement;
        break;
    default:
        statement;
        break;
}
```

- How to generate a random integer? `arc4random_uniform(upperLimit)`

### if statements

- sintax:
```
if (condition) {
    statements;
} else {
    statements;
}
```

- ternary sintax:
`condition ? statement-true : statement-false;`


## Modulo 4 - Port an App from Object-C to Swift.

- When migrating:
    - Handling everything as optional - to avoid things to crash in runtime
- iOS Engineer skills:
    - Colaboration skills.
    - General accumen of Software Engineer.
        - architectural overview.
    - Spend some time writting obj-c code.

- A category in obj-c allow us to add functionallity in a class without the need of subclassing - in Swift, is the equivalente of an extension. [4]

## References
[1] https://bignerdranch.com/blog/property-values/
[2] https://useyourloaf.com/blog/xcode-6-objective-c-modernization/
[3] https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/ObjectOwnership.html
[3] http://blog.reigndesign.com/blog/debugging-retain-cycles-in-objective-c-four-likely-culprits/
[3] https://www.bignerdranch.com/blog/actually-finding-a-memory-management-error-with-instruments/\
[4] https://www.google.com/search?client=safari&rls=en&q=obj-c+category&ie=UTF-8&oe=UTF-8

## Marks Syntax