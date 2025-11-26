package test0

import std.reflect.*

// 带有泛型约束的泛型class
public class C<T0, T1, T2> where T1 <: ToString {
    public func foo(): Unit {
        println("C<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        // BUG!
        // println("p1 = ${p1}")
        p0
    }
    public func instanceMemberFunction(p0: S<T0>, p1: Array<T1>): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.t
    }
    public func genericInstanceFunction<F0, F1>(p0: C<F0, Int64, F1>): Unit {
        println("genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
    }
}

// 无泛型约束的泛型class
public class C1<T0, T1, T2> {
    public C1(public let v0: T0, public let v1: T1, public let v2: T2) {}
    public func foo(): Unit {
        println("C<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        // BUG!
        // println("p1 = ${p1}")
        p0
    }
    public func instanceMemberFunction(p0: S<T0>, p1: Array<T1>): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.t
    }
    // 同时使用到类型泛型和函数泛型
    public func genericInstanceFunction<F0, F1>(p0: C1<F0, Int64, T0>): Int64 {
        println("genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
        114514
    }
}

public struct S<T> {
    public S(public let t: T) {}
    public func foo(): Unit {
        println("S<${TypeInfo.of<T>()}>.foo")
    }
}

public class F {}

public func testGenricFunc(): Unit {
    let c = ClassTypeInfo.get("test0.C1<Int64,String,test0.F>")
    let i = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(F())])
        .apply([111, "hello", F()])
    let r = c
        .getInstanceFunctions("genericInstanceFunction")[0]
        .apply(i, [TypeInfo.of<Int64>(), TypeInfo.of<String>()], [C1<Int64, Int64, Int64>(1, 2, 3)])
    (r as Int64) |> println
}

public func testClass(): Unit {
    println("testClass=====")
    let tp = ClassTypeInfo.get("test0.C<Int64,test0.C<Int64,String,Bool>,test0.F>")
    let c = tp.getConstructor()
    let instance = c.apply()
    let foo = tp.getInstanceFunction("foo")
    let insta = tp.getInstanceFunction("instanceMemberFunction",
        [TypeInfo.of<Int64>(), TypeInfo.get("test0.C<Int64,String,Bool>"), TypeInfo.get("test0.F")])
    foo.apply(instance, [])
    let ins = tp.getInstanceFunction("instanceMemberFunction",
        [TypeInfo.of<S<Int64>>(), TypeInfo.of<Array<C<Int64, String, Bool>>>()])
    let r = ins.apply(instance,
        [StructTypeInfo.get("test0.S<Int64>").getConstructor([TypeInfo.of<Int64>()]).apply([666])])
    let intVa = (r as Int64).getOrThrow()
    println("intVa = ${intVa}")
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
    // let tp = StructTypeInfo.get("test0.S<Int64>")
    // let c = tp.getConstructor()
    // let instance = c.apply()
    // let foo = tp.getInstanceFunction("foo")
    // foo.apply(instance, [])
}

main(): Unit {
    testGenricFunc()
    // testClass()
    // testStruct()
}
