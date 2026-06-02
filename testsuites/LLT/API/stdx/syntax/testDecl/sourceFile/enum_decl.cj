enum A { Enum }

public enum B {
    | Enum(Int64, A) | ...
    func a() {}
}

enum C <: B { Enum1 | Enum2 }

enum D<T> where T <: B { Enum }

enum E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString { Enum }

enum F {
    Enum
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}

enum G {
    | Enum(?Int64, (Int64), (Int64) -> Int64, T.A, G, VArray<Int64, $3>)
    | Enum1(?Int64)
    | Enum2((Int64))
    | Enum3((Int64) -> Int64)
    | Enum4(T.A)
    | Enum5(G)
    | Enum6(VArray<Int64, $3>)
}

@Deprecated["aaa"]
enum E1 {
    A1 | B1 | C1(Int64) | D1(Int64, String) | ...
    prop p1: Int64 {
        get() {0}
    }
    func foo() {}
}

public enum B {
    | @Deprecated["EnumA"]
    EnumA
    | @EnumField["EnumB"]
    EnumB
    | @EnumField[v: "EnumC"]
    EnumC(a, b)
    | @!EnumField["EnumD"]
    EnumD
    | @!EnumField[v: "EnumE"]
    EnumE(a, b)
    | @!EnumField
    @EnumField[v: "EnumF"]
    @!EnumField[v: "EnumF"]
    EnumF(a, b)
    | ...
    func a() {}
}