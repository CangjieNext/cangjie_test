package my_class
public class MyClass {
    public func greet(): String {
        return "hello from class"
    }
}
public func createGreeter(): MyClass {
    return MyClass()
}
public func classMethodCall(c: MyClass): String {
    return c.greet()
}
public func deadClassFunc(): String {
    return "dead"
}
