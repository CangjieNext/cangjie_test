package test0

import std.reflect.*

public class C<T0, T1, T2> where T1 <: ToString {
    public func foo(): Unit {
        println("C<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    // public func instanceMemberFunction(p0: T0, p1: T1, p2: T2, p3: ?T0, p4: Array<T1>): T0 {
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        println("p1 = ${p1}")
        p0
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
    let tp = ClassTypeInfo.get("test0.C<Int64,test0.C<Int64,String,Bool>,test0.F>")
    let c = tp.getConstructor()
    let instance = c.apply()
    let foo = tp.getInstanceFunction("foo")
    let insta = tp.getInstanceFunction("instanceMemberFunction",
        [TypeInfo.of<Int64>(), TypeInfo.get("test0.C<Int64,String,Bool>"), TypeInfo.get("test0.F")])
    foo.apply(instance, [])
    let result = insta.apply(instance,
        [114514, ClassTypeInfo.get("test0.C<Int64,String,Bool>").getConstructor().apply(),
            ClassTypeInfo.get("test0.F").getConstructor().apply()])
    let intvalue = (result as Int64).getOrThrow()
    println("intvalue = ${intvalue}")
    ClassTypeInfo.get("test0.F").name |> println
    PackageInfo.get("test0").name |> println
    TypeInfo.get("test0.F").name |> println
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
