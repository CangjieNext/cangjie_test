import std.reflect.*

interface I<N0, N1, N2> {
    func test(p0: N0, p1!: N1, p2!: N2): (N2, N0, N1) {
        println("I<${TypeInfo.of<N0>()},${TypeInfo.of<N1>()},${TypeInfo.of<N2>()}>.test")
        (p2, p0, p1)
    }
    static func test0(p0: N0, p1!: N1, p2!: N2): (N2, N0, N1) {
        println("I<${TypeInfo.of<N0>()},${TypeInfo.of<N1>()},${TypeInfo.of<N2>()}>.test")
        (p2, p0, p1)
    }
}

open class A1<M0, M1, M2> {}

extend<T0, T1, T2> A1<T0, T1, T2> <: I<T1, T2, T0> {}

open class A2 <: A1<Int64, String, Bool> {}

public func testInstancecFunc(): Unit {
    let a = A2()
    let (r0, r1, r2) = a.test("hello", p1: true, p2: 114514)
    println("r0 = ${r0}")
    println("r1 = ${r1}")
    println("r2 = ${r2}")
}

public func testStaticFunc(): Unit {
    let (r0, r1, r2) = A2.test0("hello", p1: true, p2: 114514)
    println("r0 = ${r0}")
    println("r1 = ${r1}")
    println("r2 = ${r2}")
}

main(): Unit {
    testInstancecFunc()
    testStaticFunc()
}
