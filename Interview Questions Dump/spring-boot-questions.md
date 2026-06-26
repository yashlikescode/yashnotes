# JAVA & SPRING BOOT INTERVIEW QUESTIONS & ANSWERS

## 1. Tell me about yourself
**Ideal Answer**
I am a Full-Stack Developer with around 3 years of experience building enterprise web applications using React, Spring Boot, Node.js, and cloud technologies. I have worked on microservices-based architectures, built REST APIs, optimized PostgreSQL performance, worked with Redis caching, and supported containerized deployments using Docker. My strengths are backend engineering, API design, microservices, and scalable full-stack development. I am interested in this role because it aligns well with my experience and gives me an opportunity to work on larger enterprise systems and distributed architectures.

## 2. What is Java?
**Ideal Answer**
Java is a high-level, object-oriented, platform-independent programming language. It follows the principle of **Write Once, Run Anywhere** because Java code is compiled into bytecode which runs on the JVM regardless of the underlying operating system. Java is strongly typed, statically typed, and supports features like garbage collection, multithreading, generics, and a rich standard library.

## 3. Difference between JDK, JRE, and JVM
**Ideal Answer**
- **JVM (Java Virtual Machine):** Executes Java bytecode. It is platform-specific but bytecode is platform-independent. Handles memory management, garbage collection, and runtime execution.
- **JRE (Java Runtime Environment):** Contains JVM + standard libraries. Used to **run** Java programs. Does not include compiler.
- **JDK (Java Development Kit):** Contains JRE + compiler (`javac`) + development tools. Used to **develop and compile** Java programs.

**Simple rule:** JDK ⊃ JRE ⊃ JVM

## 4. OOP Concepts with Real-Time Examples
**Ideal Answer**
- **Abstraction:** Hiding implementation details and showing only what is necessary (e.g. `interface PaymentGateway`).
- **Encapsulation:** Binding data and methods together and restricting direct access to internal state (e.g. Bank ATM).
- **Polymorphism:** One interface, multiple implementations. Compile-time (overloading) and Runtime (overriding).
- **Inheritance:** One class acquires properties and methods of another class.

## 5. Types of Inheritance in Java
**Ideal Answer**
Java supports Single, Multilevel, and Hierarchical inheritance. Multiple inheritance is NOT supported with classes to avoid the **Diamond Problem**, but it IS supported through **interfaces**.

## 6. What is Exception Handling?
**Ideal Answer**
Exception handling is a mechanism to handle runtime errors gracefully without crashing the application. Java uses `try`, `catch`, `finally`, `throw`, and `throws`.

## 7. Difference between Checked and Unchecked Exceptions
**Ideal Answer**
| Feature | Checked Exception | Unchecked Exception |
|---|---|---|
| Checked at | Compile time | Runtime |
| Must handle | Yes (try-catch or throws) | No (optional) |
| Extends | Exception | RuntimeException |
| Examples | IOException, SQLException | NullPointerException, ArrayIndexOutOfBoundsException |

## 8. Global Exception Handling in Spring Boot
**Ideal Answer**
We use `@ControllerAdvice` combined with `@ExceptionHandler` to handle exceptions globally across all controllers.
```java
@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleNotFound(ResourceNotFoundException ex) {
        return new ResponseEntity<>(new ErrorResponse(404, ex.getMessage()), HttpStatus.NOT_FOUND);
    }
}
```

## 9. Java 8 Features
**Ideal Answer**
Key features introduced in Java 8:
1. Lambda Expressions
2. Functional Interfaces
3. Streams API
4. Optional class
5. Default and Static methods in Interfaces
6. Method References
7. New Date/Time API (java.time)

## 10. Lambda Expressions & Functional Interfaces
**Ideal Answer**
A **Functional Interface** has exactly one abstract method. Lambda expressions provide a concise way to implement them.
```java
@FunctionalInterface
public interface MathOperation {
    int operate(int a, int b);
}
MathOperation add = (a, b) -> a + b;
```
Built-in examples: `Predicate`, `Function`, `Consumer`, `Supplier`.

## 11. Streams API (Intermediate vs Terminal Operations)
**Ideal Answer**
Streams API allows functional-style processing of collections.
**Intermediate Operations** (return a Stream, lazy): `filter()`, `map()`, `sorted()`, `distinct()`
**Terminal Operations** (return result, trigger processing): `collect()`, `forEach()`, `count()`, `reduce()`

## 12. Method References
**Ideal Answer**
Shorthand for lambda expressions that call a specific method (e.g., `String::toUpperCase`, `System.out::println`).

## 13. Default & Static Methods in Interfaces
**Ideal Answer**
Java 8 allowed interfaces to have concrete method implementations to support backward compatibility without breaking implementing classes.

## 14. Optional in Java 8
**Ideal Answer**
`Optional` is a container object that may or may not contain a value. It helps avoid `NullPointerException`.
```java
Optional<String> name = Optional.ofNullable(getUserName());
name.ifPresent(n -> System.out.println("Name: " + n));
```

## 15. HashMap Internal Working
**Ideal Answer**
`HashMap` uses an array of buckets. `hashCode()` determines the bucket index. Collisions are handled via linked list. From Java 8, buckets convert to a balanced tree (Red-Black Tree) when size exceeds threshold (8) for O(log n) performance. Default capacity = 16, load factor = 0.75.

## 16. ConcurrentHashMap
**Ideal Answer**
`ConcurrentHashMap` is thread-safe. Uses bucket-level locking (CAS + synchronized) in Java 8+. Unlike `HashMap`, it does **not** allow null keys or values.

## 17. ArrayList vs LinkedList
**Ideal Answer**
- **ArrayList:** Dynamic array, fast random access O(1), slow insertion/deletion in middle O(n).
- **LinkedList:** Doubly linked list, fast insertion/deletion O(1), slow random access O(n).

## 18. Fail-Fast vs Fail-Safe Iterator
**Ideal Answer**
- **Fail-Fast** (e.g., `ArrayList`, `HashMap`): Throws `ConcurrentModificationException` if collection is modified during iteration.
- **Fail-Safe** (e.g., `CopyOnWriteArrayList`, `ConcurrentHashMap`): Iterates over a clone/snapshot, no exception.

## 19. Multithreading & Thread Lifecycle
**Ideal Answer**
Multithreading allows concurrent execution. Lifecycle: NEW → RUNNABLE → (BLOCKED/WAITING/TIMED_WAITING) → RUNNABLE → TERMINATED.

## 20. yield(), join(), and sleep()
**Ideal Answer**
- `sleep(ms)`: Pauses thread, does NOT release lock.
- `yield()`: Hints JVM to pause and give chance to other threads.
- `join()`: Makes calling thread wait until target thread finishes.

## 21. Runnable vs Callable
**Ideal Answer**
`Runnable` returns `void` and cannot throw checked exceptions. `Callable` returns a result (Generic) and can throw checked exceptions. Used with `Future`.

## 22. Future vs CompletableFuture
**Ideal Answer**
`Future.get()` is blocking. `CompletableFuture` allows non-blocking asynchronous execution and chaining with methods like `thenApply`, `thenAccept`.

## 23. Executor Framework
**Ideal Answer**
Manages thread pools to reuse threads efficiently. Common pools: `FixedThreadPool`, `CachedThreadPool`, `SingleThreadExecutor`, `ScheduledThreadPool`.

## 24. StringBuilder vs StringBuffer
**Ideal Answer**
`StringBuilder` is faster but not thread-safe. `StringBuffer` is thread-safe (synchronized) but slower.

## 25. Serialization vs Deserialization
**Ideal Answer**
Converting a Java object into a byte stream (Serialization) and vice-versa (Deserialization). Object must implement `Serializable`. The `transient` keyword prevents serialization of specific fields.

## 26. Heap Memory vs Stack Memory
**Ideal Answer**
- **Stack:** Stores local variables and method calls. Fast, LIFO, specific to each thread.
- **Heap:** Stores objects. Managed by Garbage Collector, shared across all threads.

## 27. equals() vs hashCode() and == vs equals()
**Ideal Answer**
`==` compares memory references. `equals()` compares object content.
Contract: If `a.equals(b)` is true, `a.hashCode() == b.hashCode()` must be true.

## 28. this vs super
**Ideal Answer**
`this` refers to the current object instance. `super` refers to the parent class, often used to call parent constructors or overridden methods.

## 29. Generics & Type Erasure
**Ideal Answer**
Generics provide compile-time type safety. Type Erasure removes generic type information at runtime (e.g., `List<String>` becomes `List`).

## 30. Java 17 Features
**Ideal Answer**
Sealed Classes, Record Classes (immutable data carriers), Pattern Matching for `instanceof`, Text Blocks, Switch Expressions.

## 31. volatile Keyword
**Ideal Answer**
Ensures changes to a variable are visible to all threads immediately by reading directly from main memory. It guarantees visibility but NOT atomicity.

## 32. Garbage Collection
**Ideal Answer**
Automatic memory management that identifies and deletes unreachable objects in the heap. Algorithms include G1 (default), Serial, Parallel, and ZGC.

## 33. Spring vs Spring Boot
**Ideal Answer**
Spring provides fundamental dependency injection and MVC but requires heavy configuration. Spring Boot adds auto-configuration, embedded servers (Tomcat), and starter dependencies to drastically reduce boilerplate.

## 34. @SpringBootApplication
**Ideal Answer**
A meta-annotation that combines `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.

## 35. What happens when a Spring Boot app starts?
**Ideal Answer**
`SpringApplication.run()` creates the application context, scans packages, applies auto-configuration, loads properties, wires beans, and starts the embedded server.

## 36. Spring Bean Scopes
**Ideal Answer**
`singleton` (default - 1 instance per context), `prototype` (new instance every request), `request`, `session`, `application`.

## 37. @Qualifier vs @Primary
**Ideal Answer**
When multiple beans of the same type exist, `@Primary` marks the default choice, while `@Qualifier("name")` explicitly specifies which bean to inject.

## 38. @Autowired vs @Bean
**Ideal Answer**
`@Autowired` instructs Spring to inject an existing managed dependency. `@Bean` is used in a `@Configuration` class to manually create and register a bean into the context.

## 39. How @Transactional Works
**Ideal Answer**
Wraps method execution in a database transaction. Commits on success, rolls back if an unchecked exception occurs. Supports propagation levels like `REQUIRED` and `REQUIRES_NEW`.

## 40. Inversion of Control (IoC) & Dependency Injection (DI)
**Ideal Answer**
IoC delegates object creation to the Spring container. DI is the implementation, commonly using constructor injection, setter injection, or field injection.

## 41. application.properties vs application.yml
**Ideal Answer**
Both configure Spring applications. `.properties` uses flat key-value pairs (`server.port=8080`). `.yml` uses a hierarchical format, which is cleaner for nested configurations.

## 42. Complete Request Lifecycle in Spring Boot
**Ideal Answer**
Request → Embedded Tomcat → DispatcherServlet → HandlerMapping → Controller → Service → Repository → DB → Response → HttpMessageConverter (to JSON) → Client.

## 43. Authentication vs Authorization
**Ideal Answer**
Authentication is verifying identity (Who are you? e.g. login). Authorization is verifying permissions (What can you do? e.g. Roles).

## 44. JWT Authentication Flow
**Ideal Answer**
User logs in → Backend validates & generates JWT → Client stores it and sends in `Authorization: Bearer <token>` header → JWT Filter validates token and populates `SecurityContext`.

## 45. Monolith vs Microservices
**Ideal Answer**
Monoliths are single deployable units, easier to start but harder to scale. Microservices divide the app into independent, decentralized, and scalable services, though they add operational complexity.

## 46. Microservices: Inter-Service Communication
**Ideal Answer**
- **Synchronous:** `RestTemplate` (blocking), `WebClient` (reactive), `FeignClient` (declarative).
- **Asynchronous:** Event-driven using Kafka or RabbitMQ.

## 47. Circuit Breaker (Resilience4j)
**Ideal Answer**
Prevents cascading failures. If a service fails repeatedly, the circuit opens and calls the fallback method directly. States: CLOSED → OPEN → HALF_OPEN.

## 48. API Gateway vs Load Balancer
**Ideal Answer**
API Gateway acts as a single entry point handling routing, security, auth, and rate limiting. A Load Balancer distributes incoming network traffic across multiple server instances.

## 49. Eureka Service Discovery
**Ideal Answer**
Microservices register themselves with Eureka Server. Clients use it to discover active service instances dynamically without hardcoding IP addresses.

## 50. Saga Design Pattern
**Ideal Answer**
Manages distributed transactions across microservices as a sequence of local transactions. Uses Choreography (event-based) or Orchestration (central coordinator) with compensating transactions for rollbacks.

## 51. Kafka Overview & Partition Keys
**Ideal Answer**
A distributed event-streaming platform. Producers publish messages to topics, brokers store them, and consumers read them. A partition key ensures messages with the same key go to the same partition, guaranteeing order.

## 52. Redis Cache Flow
**Ideal Answer**
Reduces DB load. Flow: Check Redis → Cache Hit (return data) → Cache Miss (query DB, store in Redis, return data).

## 53. JPA vs Hibernate
**Ideal Answer**
JPA (Java Persistence API) is a specification/interface for ORM in Java. Hibernate is a concrete implementation of JPA.

## 54. JPA Cascade Types
**Ideal Answer**
Defines how operations propagate to child entities: `PERSIST`, `MERGE`, `REMOVE`, `REFRESH`, `DETACH`, `ALL`.

## 55. Lazy vs Eager Loading & N+1 Problem
**Ideal Answer**
Lazy loading defers data initialization until accessed; Eager loads immediately. The N+1 query problem occurs when 1 query fetches parents and N queries fetch their children. Fixed using `JOIN FETCH` or Entity Graphs.

## 56. Pagination & Handling Large Datasets
**Ideal Answer**
Never load all records into memory. Use `Pageable` with `JpaRepository` to fetch data in chunks (`PageRequest.of(page, size)`).

## 57. ACID Properties
**Ideal Answer**
**A**tomicity (all or nothing), **C**onsistency (valid state transitions), **I**solation (concurrent safety), **D**urability (data persists after commit).

## 58. Primary Key vs Foreign Key
**Ideal Answer**
A Primary Key uniquely identifies a row. A Foreign Key references a Primary Key in another table to enforce referential integrity.

## 59. SQL Joins & Views vs Indexes
**Ideal Answer**
- Joins: `INNER` (matches in both), `LEFT` (all left + matches), `RIGHT` (all right + matches), `FULL` (all rows).
- A View is a virtual table representing a query. An Index is a data structure to speed up data retrieval (but slows down writes).

## 60. Highest Salary Queries
**Ideal Answer**
```sql
SELECT MAX(salary) FROM employees;
-- 2nd Highest
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
```

## 61. SOLID Principles
**Ideal Answer**
- **S**ingle Responsibility: One reason to change.
- **O**pen/Closed: Open for extension, closed for modification.
- **L**iskov Substitution: Subtypes must be substitutable for base types.
- **I**nterface Segregation: Don't force implementation of unused methods.
- **D**ependency Inversion: Depend on abstractions, not concretions.

## 62. Singleton vs Factory Pattern
**Ideal Answer**
Singleton ensures one global instance (e.g., Spring Beans). Factory abstracts object creation logic based on input parameters.

## 63. How are APIs designed end-to-end?
**Ideal Answer**
Define resource → Choose HTTP method → Design DTOs → Route to Controller → Business logic in Service → DB interaction in Repository → Apply Validation & Exception Handling → Document with Swagger.

## 64. Deployment & CI/CD Flow
**Ideal Answer**
Code push to Git → CI pipeline (Maven/Gradle) runs tests & SonarQube checks → Builds Docker image → Pushes to Registry → CD pipeline deploys to Kubernetes/ECS.

## 65. Monitoring & Logging
**Ideal Answer**
Centralized logging using ELK stack or CloudWatch, metrics using Micrometer + Prometheus, distributed tracing with Zipkin, and app health via Spring Boot Actuator.

## 66. Coding: Two Sum
**Ideal Answer**
```java
public int[] twoSum(int[] nums, int target) {
    Map<Integer, Integer> map = new HashMap<>();
    for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (map.containsKey(complement)) return new int[]{map.get(complement), i};
        map.put(nums[i], i);
    }
    return new int[]{};
}
```

## 67. Coding: First Non-Repeating Character
**Ideal Answer**
```java
public char firstNonRepeating(String s) {
    Map<Character, Integer> freq = new LinkedHashMap<>();
    for (char c : s.toCharArray()) freq.put(c, freq.getOrDefault(c, 0) + 1);
    
    for (Map.Entry<Character, Integer> entry : freq.entrySet()) {
        if (entry.getValue() == 1) return entry.getKey();
    }
    return ' ';
}
```

## 68. Coding: Find Duplicates in Array
**Ideal Answer**
```java
public List<Integer> findDuplicates(List<Integer> list) {
    Set<Integer> seen = new HashSet<>();
    return list.stream()
        .filter(n -> !seen.add(n))
        .distinct()
        .collect(Collectors.toList());
}
```

## 69. Coding: Print Numbers Starting with 5
**Ideal Answer**
```java
List<Integer> startWithFive = numbers.stream()
    .map(String::valueOf)
    .filter(n -> n.startsWith("5"))
    .map(Integer::valueOf)
    .collect(Collectors.toList());
```

## 70. HR: Why are you looking for a change?
**Ideal Answer**
I'm looking for larger-scale enterprise systems, stronger distributed architecture exposure, and growth opportunities — which align well with this role and the projects here.

## 71. HR: Where do you see yourself in 3 years?
**Ideal Answer**
Growing into a senior/lead full-stack engineer, owning microservices end-to-end, contributing to system design, and mentoring junior developers.

## 72. HR: Comfortable with different time zones / clients?
**Ideal Answer**
Yes, I've collaborated with cross-functional and client teams and am highly flexible with overlapping hours for sync-ups and deployments.


# Infosys Java Interview Questions — Ideal Answers

> Generated from `uploads/infosys_java_interview_questions.md`.
> HR answers are templates; customize them with your real background, projects, notice period, location preference, and compensation expectations.

---

## SECTION 1: Core Java & OOP

### OOP Concepts

#### 1. What are the four pillars of OOP? Explain each with a Java example.
**Ideal answer:** The four pillars are encapsulation, abstraction, inheritance, and polymorphism. Encapsulation hides data using private fields and public methods. Abstraction exposes only required behavior. Inheritance reuses parent behavior. Polymorphism allows the same method call to behave differently based on the object.

```java
abstract class Animal {                 // abstraction
    abstract void sound();
}

class Dog extends Animal {              // inheritance
    private String name;                // encapsulation
    Dog(String name) { this.name = name; }
    public String getName() { return name; }
    @Override void sound() { System.out.println("Bark"); } // polymorphism
}
```

#### 2. What is the difference between Abstraction and Encapsulation?
**Ideal answer:** Abstraction hides implementation complexity and shows only essential features, usually through interfaces or abstract classes. Encapsulation hides internal data by keeping fields private and exposing controlled access through methods. Abstraction focuses on "what an object does"; encapsulation focuses on "how data is protected".

#### 3. What is method overloading vs method overriding? Give examples.
**Ideal answer:** Overloading means same method name with different parameters in the same class; it is compile-time polymorphism. Overriding means a child class provides its own implementation of a parent method with the same signature; it is runtime polymorphism.

```java
class Calculator {
    int add(int a, int b) { return a + b; }
    double add(double a, double b) { return a + b; } // overloading
}

class Parent { void show() { System.out.println("Parent"); } }
class Child extends Parent { @Override void show() { System.out.println("Child"); } }
```

#### 4. What is compile-time polymorphism vs runtime polymorphism?
**Ideal answer:** Compile-time polymorphism is resolved by the compiler, mainly through method overloading. Runtime polymorphism is resolved during execution, mainly through method overriding and dynamic method dispatch.

```java
Parent obj = new Child();
obj.show(); // Child version runs at runtime
```

#### 5. Can you override a static method in Java? Why or why not?
**Ideal answer:** No, static methods cannot be overridden because they belong to the class, not an object. If a child class defines a static method with the same signature, it is method hiding, not overriding. The method called depends on the reference type, not the object type.

#### 6. What is the difference between an abstract class and an interface?
**Ideal answer:** An abstract class can have instance variables, constructors, abstract methods, and concrete methods. An interface mainly defines a contract and supports abstract methods, default methods, static methods, and constants. A class can extend only one abstract class but can implement multiple interfaces.

#### 7. When would you use an abstract class over an interface?
**Ideal answer:** I use an abstract class when related classes need shared state, constructors, or common base implementation. I use an interface when I only need to define a capability or contract that many unrelated classes can implement.

#### 8. What is multiple inheritance? How does Java handle it?
**Ideal answer:** Multiple inheritance means a class inherits from more than one parent class. Java does not support multiple inheritance with classes to avoid ambiguity like the diamond problem. Java supports multiple inheritance of type through interfaces. If two interfaces provide the same default method, the implementing class must override it.

```java
interface A { default void show() { System.out.println("A"); } }
interface B { default void show() { System.out.println("B"); } }
class C implements A, B {
    public void show() { A.super.show(); }
}
```

#### 9. What is the `final` keyword? How does it apply to variables, methods, and classes?
**Ideal answer:** `final` restricts modification. A final variable cannot be reassigned after initialization. A final method cannot be overridden. A final class cannot be extended.

```java
final int MAX = 100;
final class Utility {}
class Parent { final void log() {} }
```

#### 10. What is a constructor? Can a constructor be private? What is a use case?
**Ideal answer:** A constructor initializes a new object. Yes, a constructor can be private. Common use cases are Singleton classes, utility classes, and factory-controlled object creation.

```java
class Singleton {
    private static final Singleton INSTANCE = new Singleton();
    private Singleton() {}
    public static Singleton getInstance() { return INSTANCE; }
}
```

---

### Java 8 Features

#### 11. What are the major features introduced in Java 8?
**Ideal answer:** Major Java 8 features include lambda expressions, functional interfaces, Stream API, Optional, default and static methods in interfaces, method references, new Date/Time API, Nashorn JavaScript engine, and improvements in concurrency such as `CompletableFuture`.

#### 12. What is a Lambda Expression? Write an example using `Comparator`.
**Ideal answer:** A lambda expression is a concise way to represent an anonymous function, mainly used with functional interfaces. It improves readability and reduces boilerplate.

```java
List<String> names = Arrays.asList("Ravi", "Asha", "John");
names.sort((a, b) -> a.compareToIgnoreCase(b));
```

#### 13. What is a Functional Interface? Name some built-in ones.
**Ideal answer:** A functional interface has exactly one abstract method and can be implemented using a lambda expression. It may also have default and static methods. Common built-in functional interfaces are `Predicate`, `Function`, `Consumer`, and `Supplier`.

```java
Predicate<Integer> isEven = n -> n % 2 == 0;
Function<String, Integer> length = s -> s.length();
Consumer<String> print = s -> System.out.println(s);
Supplier<Double> random = () -> Math.random();
```

#### 14. What is the Stream API? How is it different from a Collection?
**Ideal answer:** A Collection stores data. A Stream processes data from a source such as a collection, array, or file. Streams do not store data; they support functional-style operations like filter, map, sort, and reduce. Stream operations are lazy until a terminal operation is called.

#### 15. Explain `filter()`, `map()`, `collect()`, `reduce()` in Streams with examples.
**Ideal answer:** `filter` selects elements based on a condition. `map` transforms elements. `collect` converts stream results into a collection or other structure. `reduce` combines elements into a single result.

```java
List<Integer> nums = Arrays.asList(1, 2, 3, 4, 5);

List<Integer> squaresOfEven = nums.stream()
    .filter(n -> n % 2 == 0)
    .map(n -> n * n)
    .collect(Collectors.toList());

int sum = nums.stream().reduce(0, Integer::sum);
```

#### 16. What is `Optional` in Java 8? Why is it used?
**Ideal answer:** `Optional` is a container that may or may not contain a non-null value. It helps avoid `NullPointerException` by forcing the developer to handle absence explicitly.

```java
Optional<String> name = Optional.ofNullable(getName());
String result = name.orElse("Unknown");

name.ifPresent(System.out::println);
```

#### 17. What is a Method Reference? What are its 4 types?
**Ideal answer:** A method reference is shorthand for a lambda that only calls an existing method. The four types are static method reference, instance method of a particular object, instance method of an arbitrary object of a type, and constructor reference.

```java
Function<String, Integer> parse = Integer::parseInt;     // static
Consumer<String> printer = System.out::println;          // particular object
Function<String, String> upper = String::toUpperCase;    // arbitrary object
Supplier<List<String>> list = ArrayList::new;            // constructor
```

#### 18. What is a `default` method in an interface? Why was it introduced?
**Ideal answer:** A default method is a method with implementation inside an interface. It was introduced to add new methods to existing interfaces without breaking classes that already implement them.

```java
interface Vehicle {
    default void start() { System.out.println("Starting..."); }
}
```

#### 19. What is the difference between `map()` and `flatMap()` in Streams?
**Ideal answer:** `map` transforms each element into one value. `flatMap` transforms each element into a stream and then flattens all streams into a single stream. `flatMap` is useful for nested lists.

```java
List<List<String>> nested = Arrays.asList(
    Arrays.asList("a", "b"),
    Arrays.asList("c")
);

List<String> flat = nested.stream()
    .flatMap(List::stream)
    .collect(Collectors.toList()); // [a, b, c]
```

#### 20. How do you sort a list of objects by multiple fields using Streams?
**Ideal answer:** Use `Comparator.comparing()` and `thenComparing()`.

```java
List<Employee> sorted = employees.stream()
    .sorted(Comparator.comparing(Employee::getDepartment)
        .thenComparing(Employee::getName)
        .thenComparing(Employee::getSalary, Comparator.reverseOrder()))
    .collect(Collectors.toList());
```

#### Java 8 coding: Find the second largest element in a list using Streams.
```java
Optional<Integer> secondLargest = numbers.stream()
    .distinct()
    .sorted(Comparator.reverseOrder())
    .skip(1)
    .findFirst();
```

#### Java 8 coding: Group a list of employees by department using `Collectors.groupingBy()`.
```java
Map<String, List<Employee>> byDepartment = employees.stream()
    .collect(Collectors.groupingBy(Employee::getDepartment));
```

#### Java 8 coding: Find employees with salary > 50000 and return names sorted alphabetically.
```java
List<String> names = employees.stream()
    .filter(e -> e.getSalary() > 50000)
    .map(Employee::getName)
    .sorted()
    .collect(Collectors.toList());
```

---

### Strings

#### 21. Why is `String` immutable in Java?
**Ideal answer:** `String` is immutable for security, thread safety, caching, and String Pool optimization. Since strings are used in class loading, file paths, URLs, and database connections, immutability prevents accidental or malicious changes. It also makes strings safe to share between threads.

#### 22. What is the String Pool? What does `intern()` do?
**Ideal answer:** The String Pool is a special memory area where Java stores string literals to reuse them. `intern()` returns the canonical pooled instance of a string. If an equal string exists in the pool, it returns that reference; otherwise, it adds it to the pool.

```java
String a = "java";
String b = new String("java").intern();
System.out.println(a == b); // true
```

#### 23. What is the difference between `String`, `StringBuilder`, and `StringBuffer`?
**Ideal answer:** `String` is immutable. `StringBuilder` is mutable and not synchronized, so it is faster for single-threaded string manipulation. `StringBuffer` is mutable and synchronized, so it is thread-safe but slower.

#### 24. How does `==` differ from `.equals()` for Strings?
**Ideal answer:** `==` compares object references, while `.equals()` compares actual string content. For string content comparison, always use `.equals()`.

```java
String a = new String("abc");
String b = new String("abc");
System.out.println(a == b);      // false
System.out.println(a.equals(b)); // true
```

#### 25. What is the output of `"abc" == new String("abc")`? Why?
**Ideal answer:** The output is `false` because the literal `"abc"` is stored in the String Pool, while `new String("abc")` creates a new object in heap memory. `==` compares references, not content.

---

### Exception Handling

#### 26. What is the difference between checked and unchecked exceptions?
**Ideal answer:** Checked exceptions are checked at compile time and must be handled or declared, such as `IOException` and `SQLException`. Unchecked exceptions occur at runtime and extend `RuntimeException`, such as `NullPointerException`, `ArithmeticException`, and `IllegalArgumentException`.

#### 27. What is the difference between `throw` and `throws`?
**Ideal answer:** `throw` is used inside a method to actually throw an exception object. `throws` is used in a method signature to declare that a method may throw exceptions.

```java
void readFile() throws IOException {
    throw new IOException("File not found");
}
```

#### 28. What is the role of `finally`? Can `finally` be skipped?
**Ideal answer:** `finally` contains cleanup code that usually runs whether an exception occurs or not. It can be skipped in rare cases such as `System.exit()`, JVM crash, process kill, infinite loop before finally, or hardware failure.

#### 29. Can you catch multiple exceptions in one `catch` block?
**Ideal answer:** Yes. Since Java 7, multiple exceptions can be caught using multi-catch. The exception variable is effectively final.

```java
try {
    riskyOperation();
} catch (IOException | SQLException ex) {
    logger.error("Operation failed", ex);
}
```

#### 30. What is a custom exception? Write a simple example.
**Ideal answer:** A custom exception is a user-defined exception created to represent application-specific error conditions.

```java
class InsufficientBalanceException extends Exception {
    public InsufficientBalanceException(String message) {
        super(message);
    }
}

void withdraw(double amount) throws InsufficientBalanceException {
    if (amount > balance) throw new InsufficientBalanceException("Low balance");
}
```

#### 31. What is the difference between `Error` and `Exception`?
**Ideal answer:** `Exception` represents conditions an application may catch and handle. `Error` represents serious problems usually outside application control, such as `OutOfMemoryError` or `StackOverflowError`. Generally, applications should not try to recover from errors.

---

### Collections Framework

#### 32. What is the difference between `List`, `Set`, and `Map`?
**Ideal answer:** `List` stores ordered elements and allows duplicates. `Set` stores unique elements and may or may not maintain order depending on implementation. `Map` stores key-value pairs where keys are unique.

#### 33. What is the internal working of `HashMap`?
**Ideal answer:** `HashMap` stores entries in buckets based on the hash code of the key. It calculates a bucket index, stores key-value nodes there, and resolves collisions using linked lists or balanced trees when a bucket becomes large. It uses load factor, default 0.75, to decide when to resize and rehash. In Java 8+, long collision chains can be treeified into red-black trees.

#### 34. What is the difference between `HashMap` and `Hashtable`?
**Ideal answer:** `HashMap` is not synchronized and allows one null key and multiple null values. `Hashtable` is synchronized, legacy, and does not allow null keys or null values. For thread-safe maps, `ConcurrentHashMap` is preferred over `Hashtable`.

#### 35. What is `ConcurrentHashMap`? How is it different from `HashMap`?
**Ideal answer:** `ConcurrentHashMap` is a thread-safe map designed for concurrent access. Unlike `HashMap`, it can be safely accessed by multiple threads. It uses fine-grained synchronization/CAS mechanisms, allowing better performance than synchronizing the entire map.

#### 36. What is `LinkedHashMap`? When would you use it?
**Ideal answer:** `LinkedHashMap` extends `HashMap` and maintains insertion order or access order using a doubly linked list. It is useful when predictable iteration order is needed or when implementing an LRU cache.

```java
Map<Integer, String> map = new LinkedHashMap<>();
```

#### 37. What is `TreeMap`? How does it maintain order?
**Ideal answer:** `TreeMap` is a sorted map based on a red-black tree. It maintains keys in natural order or by a custom comparator. Basic operations like get, put, and remove take `O(log n)` time.

#### 38. Difference between `ArrayList` and `LinkedList`? When to use which?
**Ideal answer:** `ArrayList` uses a dynamic array and provides fast random access. Adding/removing at the end is usually fast, but insertion/deletion in the middle can be costly due to shifting. `LinkedList` uses nodes and is better for frequent insertions/deletions when you already have the node/iterator, but random access is slow. In most cases, `ArrayList` is preferred.

#### 39. What is `HashSet` internally backed by?
**Ideal answer:** `HashSet` is internally backed by a `HashMap`. The set elements are stored as keys in the map, and a constant dummy object is used as the value.

#### 40. How does `equals()` and `hashCode()` contract work in Collections?
**Ideal answer:** If two objects are equal according to `equals()`, they must have the same `hashCode()`. If two objects have the same hash code, they are not necessarily equal. Collections like `HashMap` and `HashSet` rely on this contract to locate and compare keys correctly.

```java
@Override public boolean equals(Object o) { /* compare fields */ }
@Override public int hashCode() { return Objects.hash(id, email); }
```

#### 41. What is the difference between `Iterator` and `ListIterator`?
**Ideal answer:** `Iterator` works with all collections and supports forward traversal and removal. `ListIterator` works only with lists and supports forward/backward traversal, adding, setting, and getting previous/next indexes.

#### 42. What is `fail-fast` vs `fail-safe` iterator?
**Ideal answer:** Fail-fast iterators throw `ConcurrentModificationException` if the collection is structurally modified while iterating, except through the iterator itself. Examples include `ArrayList` and `HashMap` iterators. Fail-safe iterators work on a copy or weakly consistent view and do not throw this exception, such as `CopyOnWriteArrayList` and `ConcurrentHashMap` iterators.

---

### Multithreading & Concurrency

#### 43. What is the difference between a `Thread` and a `Runnable`?
**Ideal answer:** `Thread` is an actual thread of execution. `Runnable` is a task that can be executed by a thread. Implementing `Runnable` is preferred because it separates task logic from thread management and allows the class to extend another class.

```java
Runnable task = () -> System.out.println("Running");
new Thread(task).start();
```

#### 44. What are the different thread states in Java?
**Ideal answer:** Java thread states are `NEW`, `RUNNABLE`, `BLOCKED`, `WAITING`, `TIMED_WAITING`, and `TERMINATED`. A thread moves through these states based on start, scheduling, locks, wait/sleep/join, and completion.

#### 45. What is synchronization? Why do we need it?
**Ideal answer:** Synchronization controls access to shared resources by multiple threads. It prevents race conditions and ensures visibility and atomicity for critical sections. Without synchronization, multiple threads can corrupt shared data.

#### 46. What is the difference between `synchronized` method and `synchronized` block?
**Ideal answer:** A synchronized method locks the entire method on the current object or class for static methods. A synchronized block locks only a specific section and can use a specific lock object, making it more flexible and often more efficient.

```java
synchronized (lock) {
    count++;
}
```

#### 47. What is `volatile` keyword? How is it different from `synchronized`?
**Ideal answer:** `volatile` ensures visibility of changes across threads; reads/writes go directly to main memory. It does not provide atomicity for compound operations like increment. `synchronized` provides both visibility and mutual exclusion/atomicity for critical sections.

#### 48. What is a `deadlock`? How can you avoid it?
**Ideal answer:** Deadlock occurs when two or more threads wait forever for locks held by each other. Avoid it by acquiring locks in a consistent order, reducing nested locks, using timeouts with `tryLock`, and keeping synchronized sections small.

#### 49. What is the `ExecutorService`? Why is it preferred over `new Thread()`?
**Ideal answer:** `ExecutorService` manages a pool of worker threads and executes submitted tasks. It is preferred because it reuses threads, controls concurrency, supports graceful shutdown, and works with `Future`/`Callable`.

```java
ExecutorService executor = Executors.newFixedThreadPool(4);
executor.submit(() -> System.out.println("Task"));
executor.shutdown();
```

#### 50. What is `Callable` vs `Runnable`? What does `Future` return?
**Ideal answer:** `Runnable` does not return a result and cannot throw checked exceptions directly. `Callable` returns a value and can throw checked exceptions. `Future` represents the result of an asynchronous computation and provides `get()`, `isDone()`, and cancellation methods.

```java
Callable<Integer> task = () -> 10 + 20;
Future<Integer> future = executor.submit(task);
Integer result = future.get();
```

#### 51. What is `ThreadLocal`? When is it used?
**Ideal answer:** `ThreadLocal` provides a separate value for each thread. It is used for per-thread data such as user context, request context, date formatters, or transaction/session context. Values should be removed after use in thread pools to avoid memory leaks.

```java
private static final ThreadLocal<String> USER = new ThreadLocal<>();
USER.set("ravi");
USER.remove();
```

---

## SECTION 2: Spring Boot

#### 52. What is Spring Boot? How is it different from the Spring Framework?
**Ideal answer:** Spring Boot is built on top of the Spring Framework and simplifies application setup using auto-configuration, embedded servers, starter dependencies, and production-ready features. Spring Framework provides core features like DI, AOP, MVC, and transaction management, while Spring Boot reduces boilerplate and configuration.

#### 53. What is auto-configuration in Spring Boot? How does it work?
**Ideal answer:** Auto-configuration automatically configures beans based on classpath dependencies, existing beans, and properties. For example, if Spring MVC is on the classpath, Boot configures DispatcherServlet and MVC defaults. It uses conditional annotations like `@ConditionalOnClass`, `@ConditionalOnMissingBean`, and `@ConditionalOnProperty`.

#### 54. What is `@SpringBootApplication`? What annotations does it combine?
**Ideal answer:** `@SpringBootApplication` is the main annotation for a Spring Boot app. It combines `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.

```java
@SpringBootApplication
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
```

#### 55. What is Dependency Injection? What are the types in Spring?
**Ideal answer:** Dependency Injection is a design pattern where dependencies are provided by the framework instead of being created manually inside a class. Spring supports constructor injection, setter injection, and field injection. Constructor injection is preferred because it supports immutability, easier testing, and required dependencies.

#### 56. What is the difference between `@Component`, `@Service`, `@Repository`, `@Controller`?
**Ideal answer:** All are Spring stereotypes. `@Component` is generic. `@Service` marks business/service layer classes. `@Repository` marks persistence layer classes and supports exception translation. `@Controller` marks MVC controllers that return views or responses.

#### 57. What is the difference between `@RestController` and `@Controller`?
**Ideal answer:** `@Controller` is used for MVC controllers and usually returns view names. `@RestController` combines `@Controller` and `@ResponseBody`, so methods return data directly as JSON/XML instead of a view.

#### 58. What is `@Autowired`? Can you autowire by constructor? Why is constructor injection preferred?
**Ideal answer:** `@Autowired` tells Spring to inject a bean dependency. Constructor injection is supported and preferred because it makes dependencies mandatory, allows final fields, improves testability, and avoids partially initialized objects. In modern Spring, if a class has one constructor, `@Autowired` is optional.

```java
@Service
class UserService {
    private final UserRepository repository;
    UserService(UserRepository repository) { this.repository = repository; }
}
```

#### 59. What is `application.properties` vs `application.yml`?
**Ideal answer:** Both configure Spring Boot applications. `application.properties` uses key-value syntax, while `application.yml` uses hierarchical YAML syntax. YAML is more readable for nested configuration, but both support profiles and externalized configuration.

#### 60. How do you handle exceptions globally in Spring Boot?
**Ideal answer:** Use `@ControllerAdvice` with `@ExceptionHandler` methods to handle exceptions globally and return consistent error responses.

```java
@RestControllerAdvice
class GlobalExceptionHandler {
    @ExceptionHandler(ResourceNotFoundException.class)
    ResponseEntity<String> handleNotFound(ResourceNotFoundException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage());
    }
}
```

#### 61. What is Spring Data JPA? How does it differ from JDBC?
**Ideal answer:** Spring Data JPA simplifies database access using repositories and ORM through JPA providers like Hibernate. It reduces boilerplate SQL and maps Java objects to database tables. JDBC requires manually writing SQL, mapping result sets, and managing more low-level details.

#### 62. What is `@Transactional`? What propagation types exist?
**Ideal answer:** `@Transactional` defines transaction boundaries. If a method fails, changes can be rolled back. Common propagation types are `REQUIRED`, `REQUIRES_NEW`, `SUPPORTS`, `MANDATORY`, `NOT_SUPPORTED`, `NEVER`, and `NESTED`. Default propagation is `REQUIRED`.

#### 63. How do you create a RESTful API in Spring Boot?
**Ideal answer:** I usually create layered components: Controller handles HTTP requests, Service contains business logic, Repository handles database operations, and Entity/DTO classes represent data.

```java
@RestController
@RequestMapping("/users")
class UserController {
    private final UserService service;
    UserController(UserService service) { this.service = service; }

    @GetMapping("/{id}")
    UserDto getUser(@PathVariable Long id) {
        return service.getUser(id);
    }
}

@Service
class UserService {
    private final UserRepository repo;
    UserService(UserRepository repo) { this.repo = repo; }
    UserDto getUser(Long id) { return repo.findDtoById(id); }
}
```

#### 64. What is the difference between `@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`?
**Ideal answer:** These are shortcut annotations for HTTP methods. `@GetMapping` reads data, `@PostMapping` creates data, `@PutMapping` updates/replaces data, and `@DeleteMapping` deletes data. They are specialized versions of `@RequestMapping`.

#### 65. What is AOP? What is `@Aspect`, `@Before`, `@After`, `@Around`?
**Ideal answer:** AOP, or Aspect-Oriented Programming, separates cross-cutting concerns such as logging, security, auditing, and transactions from business logic. `@Aspect` defines an aspect. `@Before` runs before a join point, `@After` runs after, and `@Around` wraps execution and can control whether the method proceeds.

```java
@Aspect
@Component
class LoggingAspect {
    @Around("execution(* com.example.service.*.*(..))")
    Object log(ProceedingJoinPoint pjp) throws Throwable {
        long start = System.currentTimeMillis();
        try { return pjp.proceed(); }
        finally { System.out.println("Time: " + (System.currentTimeMillis() - start)); }
    }
}
```

---

## SECTION 3: Microservices

#### 66. What are microservices? How do they differ from monolithic architecture?
**Ideal answer:** Microservices are small, independently deployable services organized around business capabilities. A monolith is a single deployable application containing all modules. Microservices improve independent scaling and deployment but add complexity in networking, monitoring, data consistency, and operations.

#### 67. What is an API Gateway? What role does it play?
**Ideal answer:** An API Gateway is the single entry point for clients. It handles routing, authentication, rate limiting, request/response transformation, SSL termination, logging, and sometimes load balancing. It prevents clients from directly calling many internal services.

#### 68. How do microservices communicate?
**Ideal answer:** Microservices communicate synchronously using REST/gRPC or asynchronously using message brokers like Kafka or RabbitMQ. REST is simple and good for request-response flows. Messaging is better for event-driven workflows, loose coupling, retries, and high throughput.

#### 69. What is service discovery? Name tools used.
**Ideal answer:** Service discovery helps services find each other dynamically because instances can scale up/down and IPs can change. Tools include Eureka, Consul, ZooKeeper, Kubernetes Services, and cloud-native service discovery mechanisms.

#### 70. What is a circuit breaker? What is Resilience4j?
**Ideal answer:** A circuit breaker prevents repeated calls to a failing service. It moves between closed, open, and half-open states. Resilience4j is a Java fault-tolerance library that provides circuit breaker, retry, rate limiter, bulkhead, and timeout patterns.

#### 71. What is the difference between synchronous and asynchronous communication in microservices?
**Ideal answer:** Synchronous communication waits for an immediate response, such as REST calls. It is simple but can increase latency and cascading failures. Asynchronous communication uses events/messages and does not require the caller to wait, improving decoupling and resilience but adding eventual consistency and message handling complexity.

#### 72. How do you handle distributed transactions?
**Ideal answer:** Distributed transactions can be handled with Saga pattern, where each service performs a local transaction and publishes an event; if a step fails, compensating transactions undo previous work. Two-phase commit exists but is often avoided in microservices because it reduces availability and increases coupling.

#### 73. How do you secure microservices?
**Ideal answer:** Common methods include OAuth 2.0/OpenID Connect, JWT tokens, API Gateway authentication, service-to-service mTLS, role-based access control, secrets management, rate limiting, input validation, and centralized logging/auditing.

---

## SECTION 4: Database & SQL

#### 74. What is the difference between `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL OUTER JOIN`?
**Ideal answer:** `INNER JOIN` returns matching rows from both tables. `LEFT JOIN` returns all rows from the left table and matching rows from the right. `RIGHT JOIN` returns all rows from the right table and matching rows from the left. `FULL OUTER JOIN` returns all rows from both tables, matching where possible and using nulls where no match exists.

```sql
SELECT e.name, d.name
FROM employee e
LEFT JOIN department d ON e.department_id = d.id;
```

#### 75. What are indexes? When should you use them? Any downside?
**Ideal answer:** Indexes are database structures that speed up reads/searches on columns. They are useful on columns used frequently in `WHERE`, `JOIN`, `ORDER BY`, and unique constraints. Downsides are extra storage and slower inserts/updates/deletes because indexes must also be updated.

#### 76. What is a Primary Key vs Foreign Key vs Unique Key?
**Ideal answer:** A primary key uniquely identifies each row and cannot be null. A foreign key references a primary/unique key in another table and maintains referential integrity. A unique key ensures values in a column or column combination are unique; depending on the database, it may allow nulls.

#### 77. What is normalization? Explain 1NF, 2NF, 3NF.
**Ideal answer:** Normalization organizes data to reduce redundancy and improve integrity. 1NF means atomic column values and no repeating groups. 2NF means 1NF plus no partial dependency on part of a composite key. 3NF means 2NF plus no transitive dependency between non-key attributes.

#### 78. What is the difference between `WHERE` and `HAVING`?
**Ideal answer:** `WHERE` filters rows before grouping. `HAVING` filters groups after `GROUP BY`. Aggregate functions like `COUNT` and `SUM` are usually used in `HAVING`.

```sql
SELECT department_id, COUNT(*)
FROM employee
WHERE active = true
GROUP BY department_id
HAVING COUNT(*) > 5;
```

#### 79. What are stored procedures vs functions in SQL?
**Ideal answer:** A function returns a value and can often be used inside SQL expressions. A stored procedure may perform operations such as inserts/updates and may return zero or more result sets depending on the database. Procedures are called explicitly, while functions are often used in queries.

#### 80. What is `ACID` in databases?
**Ideal answer:** ACID stands for Atomicity, Consistency, Isolation, and Durability. Atomicity means all-or-nothing transactions. Consistency means data moves from one valid state to another. Isolation means concurrent transactions do not interfere incorrectly. Durability means committed data survives failures.

#### 81. What is the N+1 query problem in JPA? How do you fix it?
**Ideal answer:** N+1 occurs when one query loads parent records and then one additional query is executed for each parent to load related data. It causes performance issues. Fixes include `JOIN FETCH`, `@EntityGraph`, batch fetching, DTO projections, and carefully choosing fetch strategies.

```java
@Query("select e from Employee e join fetch e.department")
List<Employee> findAllWithDepartment();
```

---

## SECTION 5: Design Patterns

#### 82. What is the Singleton pattern? Implement a thread-safe Singleton in Java.
**Ideal answer:** Singleton ensures only one instance of a class exists and provides a global access point. The best simple approach in Java is an enum singleton, but double-checked locking is also common.

```java
public class Singleton {
    private static volatile Singleton instance;
    private Singleton() {}

    public static Singleton getInstance() {
        if (instance == null) {
            synchronized (Singleton.class) {
                if (instance == null) instance = new Singleton();
            }
        }
        return instance;
    }
}
```

#### 83. What is the Factory pattern? When do you use it?
**Ideal answer:** Factory pattern creates objects without exposing object creation logic to the client. It is used when object creation depends on input, configuration, or when we want to decouple client code from concrete classes.

```java
interface Payment { void pay(); }
class UpiPayment implements Payment { public void pay() {} }
class CardPayment implements Payment { public void pay() {} }

class PaymentFactory {
    static Payment create(String type) {
        return switch (type) {
            case "UPI" -> new UpiPayment();
            case "CARD" -> new CardPayment();
            default -> throw new IllegalArgumentException("Invalid type");
        };
    }
}
```

#### 84. What is the Builder pattern? Where is it used in Java?
**Ideal answer:** Builder pattern constructs complex objects step by step and improves readability when there are many optional fields. Examples include `StringBuilder`, `StringBuffer`, and Lombok's `@Builder`.

```java
User user = new User.Builder()
    .name("Asha")
    .email("asha@example.com")
    .age(25)
    .build();
```

#### 85. What is the Strategy pattern? Give a real-world example.
**Ideal answer:** Strategy pattern defines a family of algorithms and makes them interchangeable at runtime. A real-world example is choosing payment strategy: UPI, credit card, or wallet.

```java
interface DiscountStrategy { double apply(double amount); }
class NoDiscount implements DiscountStrategy { public double apply(double a) { return a; } }
class FestivalDiscount implements DiscountStrategy { public double apply(double a) { return a * 0.8; } }
```

#### 86. What is the Observer pattern?
**Ideal answer:** Observer pattern defines a one-to-many dependency where observers are notified when the subject changes. It is used in event systems, messaging, UI listeners, and publish-subscribe models.

#### 87. What SOLID principles do you follow in your code?
**Ideal answer:** SOLID principles are: Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion. I apply them by keeping classes focused, using interfaces for extensibility, avoiding tight coupling, and injecting dependencies instead of creating them directly.

---

## SECTION 6: System Design

#### 88. Design a URL shortener like Bit.ly.
**Ideal answer:** Main components: API service, database, cache, ID generator, redirect service, and analytics service. Create short URL by generating a unique ID, converting it to Base62, storing mapping `{code -> longUrl}`, and returning the short link. Redirect by looking up code in Redis cache first, then database, and returning HTTP 301/302. Use rate limiting, custom aliases, expiry, click tracking, and horizontal scaling.

#### 89. Design a notification system.
**Ideal answer:** A notification system should accept events, store notification records, choose channels like email/SMS/push/in-app, and send asynchronously through a queue. Components include notification API, template service, user preference service, message broker, workers, provider integrations, retry/DLQ, and monitoring. It should support priority, deduplication, retries, and audit logs.

#### 90. How would you design a REST API that handles 1 million requests per day?
**Ideal answer:** 1 million/day is about 12 requests/second on average, but design for peak traffic. Use stateless services behind a load balancer, database indexing, connection pooling, caching, pagination, rate limiting, async processing for heavy tasks, monitoring, and horizontal scaling. Keep APIs idempotent where possible and use proper status codes.

#### 91. What is caching? When would you use Redis?
**Ideal answer:** Caching stores frequently accessed data in a faster layer to reduce latency and database load. Redis is useful for session storage, frequently read data, rate limiting, distributed locks, counters, pub/sub, leaderboards, and temporary tokens. Cache invalidation and TTL should be designed carefully.

#### 92. What is horizontal vs vertical scaling?
**Ideal answer:** Vertical scaling means increasing resources of one machine, such as CPU/RAM. Horizontal scaling means adding more machines/instances. Vertical scaling is simpler but limited. Horizontal scaling provides better availability and elasticity but requires load balancing and stateless design.

#### 93. How do you ensure high availability in a distributed system?
**Ideal answer:** Use multiple instances across availability zones, load balancers, health checks, replication, automated failover, retries with backoff, circuit breakers, queues for async processing, backups, disaster recovery planning, monitoring, and alerting. Avoid single points of failure.

---

## SECTION 7: HR Round

#### 94. Tell me about yourself.
**Ideal answer:** I am a Java developer with experience in core Java, OOP, collections, Java 8 features, SQL, and Spring Boot. I have worked on building REST APIs, implementing business logic, integrating databases, and debugging application issues. I enjoy writing clean and maintainable code and continuously improving my understanding of backend systems. I am looking for an opportunity where I can contribute to real enterprise projects and grow as a software engineer.

#### 95. Why do you want to join Infosys?
**Ideal answer:** I want to join Infosys because it is a globally respected IT services company with strong training, enterprise-scale projects, and opportunities to work across domains. I believe my Java and Spring Boot skills align well with Infosys projects, and I am excited to learn, contribute, and grow in a professional engineering environment.

#### 96. What is your greatest strength and weakness?
**Ideal answer:** My strength is that I am consistent and analytical. When I face a problem, I break it into smaller parts, debug systematically, and document my learnings. My weakness is that sometimes I spend extra time perfecting a solution, but I am improving by prioritizing tasks, asking for early feedback, and balancing quality with deadlines.

#### 97. Where do you see yourself in 5 years?
**Ideal answer:** In five years, I see myself as a strong full-stack/backend engineer or technical lead who can design reliable systems, mentor juniors, and deliver business-critical features. I want to deepen my expertise in Java, Spring Boot, cloud, microservices, and system design while contributing meaningfully to the organization.

#### 98. Describe a challenging project and how you handled it.
**Ideal answer:** In one project, I worked on a REST API with complex validation and database interactions. The challenge was handling edge cases and maintaining clean code. I divided the work into controller, service, and repository layers, added proper exception handling, wrote test cases, and optimized queries. As a result, the API became more reliable and easier to maintain.

#### 99. Are you comfortable relocating / working in shifts?
**Ideal answer:** Yes, I am open to relocation and working in shifts based on project requirements. I understand that client projects may need flexibility, and I am willing to adapt while maintaining productivity and communication.

#### 100. What are your salary expectations?
**Ideal answer:** My expectation is flexible and aligned with the role, company standards, and my skills. I am more focused on the opportunity, learning, and long-term growth. I would be happy to discuss a fair compensation based on the responsibilities and market range.

---

## Quick Last-Minute Revision Points

- Be strong in OOP, Java 8 streams/lambdas, collections, exceptions, and multithreading.
- For Spring Boot, explain DI, REST layers, `@Transactional`, JPA, and global exception handling.
- For SQL, know joins, indexes, ACID, normalization, and N+1 problem.
- For experienced roles, prepare microservices, caching, API gateway, circuit breaker, and basic system design.
- Practice writing short Java code snippets by hand, especially streams and design patterns.



# Spring Boot Interview Preparation

## 1. What is the Bean Lifecycle in Spring Boot?

### Answer

A Spring Bean goes through the following lifecycle:

1. Bean Instantiation
2. Dependency Injection
3. Aware Interfaces Execution (Optional)
4. BeanPostProcessor Before Initialization
5. Initialization (@PostConstruct)
6. Bean Ready for Use
7. BeanPostProcessor After Initialization
8. Bean Destruction (@PreDestroy)

### Example

```java
@Component
public class UserService {

    @PostConstruct
    public void init() {
        System.out.println("Bean Initialized");
    }

    @PreDestroy
    public void destroy() {
        System.out.println("Bean Destroyed");
    }
}
```

### Lifecycle Flow

Bean Creation
→ Dependency Injection
→ @PostConstruct
→ Bean Ready
→ @PreDestroy
→ Bean Destroyed

---

## 2. What are the most commonly used Spring Boot Annotations?

### @SpringBootApplication

Main application annotation.

```java
@SpringBootApplication
public class Application {
}
```

Combines:
- @Configuration
- @EnableAutoConfiguration
- @ComponentScan

### @Component

Generic Spring Bean.

```java
@Component
public class Utility {
}
```

### @Service

Business logic layer.

```java
@Service
public class UserService {
}
```

### @Repository

Database access layer.

```java
@Repository
public interface UserRepository {
}
```

### @Controller

Returns Views.

```java
@Controller
public class HomeController {
}
```

### @RestController

Returns JSON/XML.

```java
@RestController
public class UserController {
}
```

### @Autowired

Dependency Injection.

```java
@Autowired
private UserService userService;
```

### @Configuration

Configuration class.

```java
@Configuration
public class AppConfig {
}
```

### @Bean

Manual bean creation.

```java
@Bean
public RestTemplate restTemplate() {
    return new RestTemplate();
}
```

### @Value

Inject values from properties.

```java
@Value("${server.port}")
private String port;
```

### @PostConstruct

Runs after bean initialization.

```java
@PostConstruct
public void init() {
}
```

### @PreDestroy

Runs before bean destruction.

```java
@PreDestroy
public void cleanup() {
}
```

### Request Mapping Annotations

```java
@GetMapping("/users")
@PostMapping("/users")
@PutMapping("/users/{id}")
@DeleteMapping("/users/{id}")
@RequestMapping("/users")
```

### Parameter Annotations

```java
@PathVariable
@RequestParam
@RequestBody
```

---

## 3. What are Controllers, Services, Repositories and Components?

### Controller

Handles HTTP requests and responses.

```java
@RestController
public class UserController {

    @GetMapping("/users")
    public List<User> getUsers() {
        return userService.getUsers();
    }
}
```

Responsibilities:
- Receive requests
- Validate input
- Return responses

---

### Service

Contains business logic.

```java
@Service
public class UserService {

    public List<User> getUsers() {
        return repository.findAll();
    }
}
```

Responsibilities:
- Business rules
- Calculations
- Processing

---

### Repository

Communicates with the database.

```java
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
```

Responsibilities:
- CRUD operations
- Database queries

---

### Component

Generic Spring-managed bean.

```java
@Component
public class EmailUtility {
}
```

Responsibilities:
- Utility classes
- Shared functionality

---

### Typical Request Flow

Client
→ Controller
→ Service
→ Repository
→ Database

Database
→ Repository
→ Service
→ Controller
→ Client

---

## 4. What are the major updates in Spring Boot 4 compared to Spring Boot 3?

### Java 21 Baseline

Spring Boot 4 requires Java 21.

Benefits:
- Virtual Threads
- Better JVM performance
- Modern language features

---

### Spring Framework 7

Built on Spring Framework 7.

Benefits:
- Improved performance
- Better observability
- Better cloud support

---

### Enhanced AOT Processing

Benefits:
- Faster startup
- Reduced memory usage
- Better native image support

---

### Improved GraalVM Native Image Support

Benefits:
- Faster startup time
- Lower memory consumption

---

### Better Observability

Supports:
- Micrometer
- OpenTelemetry
- Distributed tracing

---

### Security Improvements

- Newer Spring Security integration
- Improved defaults
- Better authentication and authorization

---

### Removed Deprecated APIs

APIs deprecated in Spring Boot 3 have been removed.

---

## Quick Spring Boot Interview Questions

### What is a Bean?
A Java object managed by the Spring IoC Container.

### What is Dependency Injection?
Providing dependencies from outside instead of creating them inside a class.

### Difference between @Component and @Service?
@Service is a specialized @Component intended for business logic.

### Difference between @Controller and @RestController?
@Controller returns views while @RestController returns JSON/XML.

### Why use @Autowired?
To inject dependencies automatically.

### What is the role of a Service class?
To contain business logic.

### What is the role of a Repository?
To interact with the database.

# Spring Boot Actuators

## What is an Actuator?

Spring Boot Actuator is a sub-module that adds **production-ready features** to your application — monitoring, health checks, metrics, and operational visibility — without writing extra code.

Add it via Maven:
```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

Or Gradle:
```groovy
implementation 'org.springframework.boot:spring-boot-starter-actuator'
```

---

## How It Works

Actuator exposes **endpoints** (HTTP or JMX) that return operational data about your running app. By default, most endpoints are **disabled over HTTP** for security — you enable only what you need.

Base URL (default): `http://localhost:8080/actuator`

---

## Built-in Endpoints

| Endpoint | URL | Description |
|---|---|---|
| `health` | `/actuator/health` | App health status |
| `info` | `/actuator/info` | Custom app metadata |
| `metrics` | `/actuator/metrics` | JVM, CPU, memory, HTTP stats |
| `env` | `/actuator/env` | Environment properties |
| `beans` | `/actuator/beans` | All Spring beans in context |
| `mappings` | `/actuator/mappings` | All `@RequestMapping` routes |
| `loggers` | `/actuator/loggers` | View/change log levels at runtime |
| `threaddump` | `/actuator/threaddump` | JVM thread dump |
| `heapdump` | `/actuator/heapdump` | Downloads a heap dump file |
| `httptrace` | `/actuator/httptrace` | Last 100 HTTP requests |
| `scheduledtasks` | `/actuator/scheduledtasks` | All scheduled tasks |
| `shutdown` | `/actuator/shutdown` | Gracefully shuts down the app (POST) |
| `caches` | `/actuator/caches` | Cache details |

---

## Enabling Endpoints

### Expose all endpoints (dev/local only):
```yaml
# application.yml
management:
  endpoints:
    web:
      exposure:
        include: "*"
```

### Expose specific endpoints (recommended for prod):
```yaml
management:
  endpoints:
    web:
      exposure:
        include: health, info, metrics, loggers
```

### Enable the shutdown endpoint (disabled by default):
```yaml
management:
  endpoint:
    shutdown:
      enabled: true
```

---

## Health Endpoint

`GET /actuator/health`

Default response:
```json
{
  "status": "UP"
}
```

Show full details (disk, DB, custom checks):
```yaml
management:
  endpoint:
    health:
      show-details: always   # or: when-authorized, never
```

Full response:
```json
{
  "status": "UP",
  "components": {
    "db": { "status": "UP", "details": { "database": "PostgreSQL" } },
    "diskSpace": { "status": "UP", "details": { "total": 499963174912, "free": 203648155648 } }
  }
}
```

### Custom Health Indicator

```java
@Component
public class ExternalServiceHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        boolean serviceUp = checkExternalService(); // your logic
        if (serviceUp) {
            return Health.up().withDetail("externalApi", "reachable").build();
        }
        return Health.down().withDetail("externalApi", "unreachable").build();
    }
}
```

---

## Info Endpoint

`GET /actuator/info`

Add metadata in `application.yml`:
```yaml
info:
  app:
    name: My Spring Boot App
    version: 1.0.0
    description: REST API for order management
  build:
    java-version: 17
```

Or inject build info automatically using the Maven plugin:
```xml
<plugin>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-maven-plugin</artifactId>
  <executions>
    <execution>
      <goals><goal>build-info</goal></goals>
    </execution>
  </executions>
</plugin>
```

---

## Metrics Endpoint

`GET /actuator/metrics` — lists all available metric names.

`GET /actuator/metrics/{metric.name}` — gets a specific metric.

Examples:
```
/actuator/metrics/jvm.memory.used
/actuator/metrics/http.server.requests
/actuator/metrics/process.cpu.usage
```

Sample response:
```json
{
  "name": "jvm.memory.used",
  "measurements": [{ "statistic": "VALUE", "value": 134217728 }],
  "availableTags": [
    { "tag": "area", "values": ["heap", "nonheap"] }
  ]
}
```

Filter with tags:
```
/actuator/metrics/jvm.memory.used?tag=area:heap
```

### Micrometer Integration

Spring Boot Actuator uses **Micrometer** as its metrics facade. Plug in exporters for your monitoring stack:

```xml
<!-- Prometheus -->
<dependency>
  <groupId>io.micrometer</groupId>
  <artifactId>micrometer-registry-prometheus</artifactId>
</dependency>
```

```yaml
management:
  endpoints:
    web:
      exposure:
        include: prometheus
```

Then scrape `/actuator/prometheus` with your Prometheus server.

---

## Loggers Endpoint

View current log levels:
```
GET /actuator/loggers
GET /actuator/loggers/com.example.service
```

**Change log level at runtime (no restart):**
```bash
curl -X POST http://localhost:8080/actuator/loggers/com.example.service \
  -H "Content-Type: application/json" \
  -d '{"configuredLevel": "DEBUG"}'
```

Reset to default:
```bash
curl -X POST http://localhost:8080/actuator/loggers/com.example.service \
  -H "Content-Type: application/json" \
  -d '{"configuredLevel": null}'
```

---

## Custom Endpoint

Create your own actuator endpoint:

```java
@Component
@Endpoint(id = "appstatus")   // accessible at /actuator/appstatus
public class AppStatusEndpoint {

    @ReadOperation
    public Map<String, Object> status() {
        Map<String, Object> info = new HashMap<>();
        info.put("mode", "production");
        info.put("featureFlags", List.of("DARK_MODE", "BETA_API"));
        return info;
    }

    @WriteOperation
    public void updateMode(@Selector String mode) {
        // update some config
    }
}
```

---

## Changing the Base Path

```yaml
management:
  endpoints:
    web:
      base-path: /manage   # now: /manage/health, /manage/metrics, etc.
```

Run actuator on a different port (recommended for prod):
```yaml
management:
  server:
    port: 9090
```

---

## Securing Actuator Endpoints

With Spring Security on the classpath, lock down actuator routes:

```java
@Configuration
public class ActuatorSecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(auth -> auth
            .requestMatchers("/actuator/health", "/actuator/info").permitAll()
            .requestMatchers("/actuator/**").hasRole("ADMIN")
            .anyRequest().authenticated()
        );
        return http.build();
    }
}
```

---

## Common `application.yml` Config (Production Template)

```yaml
management:
  server:
    port: 9090
  endpoints:
    web:
      base-path: /actuator
      exposure:
        include: health, info, metrics, loggers, prometheus
  endpoint:
    health:
      show-details: when-authorized
    shutdown:
      enabled: false

info:
  app:
    name: ${spring.application.name}
    version: @project.version@
```

---

## Quick Reference

| Task | How |
|---|---|
| Enable all endpoints | `include: "*"` |
| Show health details | `show-details: always` |
| Custom health check | Implement `HealthIndicator` |
| Custom endpoint | `@Endpoint(id = "...")` |
| Change log level live | `POST /actuator/loggers/{name}` |
| Export to Prometheus | Add `micrometer-registry-prometheus` |
| Secure endpoints | Spring Security on `/actuator/**` |
| Different port | `management.server.port: 9090` |