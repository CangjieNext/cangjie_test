package test0

import std.reflect.*

public class C<T0, T1, T2> {
    public func foo(): Unit {
        println("C<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction<F0, F1, F2>(p0: T0, p1: T1, p2: T2, p3: ?T0, p4: Array<T1>): T0 {
        println("")
    }
}

public struct S<T> {
    public func foo(): Unit {
        println("S<${TypeInfo.of<T>()}>.foo")
    }
}

public class F {}

public func testClass(): Unit {
    println("testClass=====")
    let tp = ClassTypeInfo.get("test0.C<Int64>")
    let c = tp.getConstructor()
    let instance = c.apply()
    let foo = tp.getInstanceFunction("foo")
    foo.apply(instance, [])
    ClassTypeInfo.get("test0.F").name |> println
    PackageInfo.get("test0").name |> println
}

public func testStruct(): Unit {
    println("testStruct=====")
    let tp = StructTypeInfo.get("test0.S<Int64>")
    let c = tp.getConstructor()
    let instance = c.apply()
    let foo = tp.getInstanceFunction("foo")
    foo.apply(instance, [])
}

main(): Unit {
    testClass()
    testStruct()
}
