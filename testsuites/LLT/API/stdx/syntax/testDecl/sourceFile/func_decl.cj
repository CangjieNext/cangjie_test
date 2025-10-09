func b(param1: Int64): Int64 {
    1
    1 + 1
    "a"
}

public class A {
    public A() {}
    public init(a: A) {
        println(a)
    }
    public operator func +(right: A): A {
        right
    }
    public open func function(): Unit {}

    ~ init() {}
}

func c<T, S>(param1: Int64): Int64 where T <: A<S>, S <: ToString & B {}

func a() {
    unsafe {println()}
}

foreign func foo(): Int64

const func func_1() {}

public class B {
    const init(b: B) {
        println(b)
    }
}