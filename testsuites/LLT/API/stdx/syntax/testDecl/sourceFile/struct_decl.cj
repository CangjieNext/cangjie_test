struct A {}

public struct B {
    var a = 1
}

struct C <: B {}

struct D<T> where T <: B {}

struct E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}

struct F {
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}