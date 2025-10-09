@testMacro
class A {}

class B {
    @testMacro[public func]
    func a() {}

    @macroPackage.testMacro(var b = 1)
}

@p1.M1[tok1]( func foo(): Int64 {
    return 1
})
@M1[a: tok1, b: tok2]
func foo<T>(a: T, b!: Int64 = 0) {
    return a
}
@M_A_B(func foo() {})
@M1
func foo(a: T) : (T, T) {
    (a, a)
}

@p1.M1[tok1](@Deprecated["a"] class C1 {
    public C1(var a: Int64) {}
})
@M1[a: tok1, b: tok2]
@Deprecated["a"]
class C1<T, U> <: I1 & C2<T> where T <: I1 & I2, U <: I3 {
    public C1(var a: T, public let b: U) {}
}
@M_A_B(class C1 {})
@M1
@Deprecated["a"]
class C1 <: C2 {
    init() {
        super()
    }
    func foo() {
        return 100
    }
}