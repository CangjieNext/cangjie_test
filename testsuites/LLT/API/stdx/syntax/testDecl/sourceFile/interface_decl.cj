interface A {}

public interface B {
    func a(): Int64
}

interface C <: B {}

interface D<T> where T <: B {}

interface E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}

interface F {
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}