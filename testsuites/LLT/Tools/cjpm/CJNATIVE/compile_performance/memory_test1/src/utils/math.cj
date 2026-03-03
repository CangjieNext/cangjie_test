package demo.utils

// 定义一个 public 函数，这样才能被其他包访问
public func add(a: Int64, b: Int64): Int64 {
    return a + b
}

// 定义一个 public 类
public class Greeter {
    public func sayHello(): Unit {
        println("Hello from Utils Package!")
    }
}