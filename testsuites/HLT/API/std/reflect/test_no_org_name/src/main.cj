package test0

import std.reflect.*

// 带有泛型约束的泛型class
public class GenericClassWithConstraints<T0, T1, T2> where T1 <: ToString {
    public func foo(): Unit {
        println("GenericClassWithConstraints<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        // BUG!由于T1有类型约束所以可以直接toString，但是目前有BUG会导致crash
        println("p1 = ${p1}")
        p0
    }
    public func instanceMemberFunction(p0: S<T0>, p1: Array<T1>): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.t
    }
    public func genericInstanceFunction<F0, F1>(p0: GenericClassWithConstraints<F0, Int64, F1>): Unit {
        println("genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
    }
}

// 无泛型约束的泛型class
public class GenericClass<T0, T1, T2> {
    public GenericClass(public var v0: T0, public let v1: T1, public let v2: T2) {}
    public mut prop p0: T0 {
        get() {
            v0
        }
        set(v) {
            v0 = v
        }
    }
    public func foo(): Unit {
        println("GenericClassWithConstraints<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        p0
    }
    public func instanceMemberFunction(p0: S<T0>, p1: Array<T1>): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.t
    }
    // 同时使用到类型泛型和函数泛型
    public func genericInstanceFunction<F0, F1>(p0: GenericClass<F0, Int64, T0>): Int64 {
        println("genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
        114514
    }
    public static func staticMemberFunction(p0: T0, p1: S<T1>): T1 {
        println("GenericClass<${TypeInfo.of<T0>()}, ${TypeInfo.of<T1>()}, ${TypeInfo.of<T2>()}>")
        println("p0: ${TypeInfo.of(p0)}")
        println("p1: ${StructTypeInfo.of(p1)}")
        p1.t
    }
    public mut static prop sp0: S<String> {
        get() {
            println("GenericClass.sp0.get")
            _sp0
        }
        set(v) {
            println("GenericClass.sp0.set")
            _sp0 = v
        }
    }
    public static var _sp0: S<String> = S<String>("hello")
    public static var sv0: S<String> = S<String>("hello")
    public operator func +(p0: T0): T0 {
        p0
    }
}

public struct S<T> {
    public S(public let t: T) {}
    public func foo(): Unit {
        println("S<${TypeInfo.of<T>()}>.foo")
    }
}

public class NonGenericClass {}

public func testGenricFunc(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let i = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
        .apply([111, "hello", NonGenericClass()])
    let r = c
        .getInstanceFunctions("genericInstanceFunction")[0]
        .apply(i, [TypeInfo.of<Int64>(), TypeInfo.of<String>()], [GenericClass<Int64, Int64, Int64>(1, 2, 3)])
    (r as Int64) |> println
}

public func testClass(): Unit {
    println("testClass=====")
    println("实例成员")
    // testClassInstanceFunction()
    testClassInstanceVariable()
    testClassInstanceProperty()
    testClassOperatorFunc()
    println("静态成员")
    testClassStaticFunction()
    testClassStaticVariable()
    testClassStaticProperty()
}

public func testClassStaticFunction(): Unit {
    println("测试泛型class的静态成员函数")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticFunction("staticMemberFunction", [TypeInfo.of<Int64>(), TypeInfo.of<S<String>>()])
    let result = s.apply(c, [114514, S<String>("hello")]) as String
    println("result = ${result}")
}

public func testClassStaticProperty(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticProperty("sp0")
    println("读静态属性")
    println("(s.getValue() as S<String>).getOrThrow().t = ${(s.getValue() as S<String>).getOrThrow().t}")
    println("写静态属性")
    s.setValue(S("world"))
    println("再次读静态属性")
    println("(s.getValue() as S<String>).getOrThrow().t = ${(s.getValue() as S<String>).getOrThrow().t}")
}

public func testClassStaticVariable(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticVariable("sv0")
    println("读静态变量")
    println("(s.getValue() as S<String>).getOrThrow().t = ${(s.getValue() as S<String>).getOrThrow().t}")
    println("写静态变量")
    s.setValue(S("world"))
    println("再次读静态变量")
    println("(s.getValue() as S<String>).getOrThrow().t = ${(s.getValue() as S<String>).getOrThrow().t}")
}

public func testClassOperatorFunc(): Unit {
    println("测试泛型class的操作符重载函数")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getInstanceFunction("+", [TypeInfo.of<Int64>()])
    let instance = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
        .apply([111, "hello", NonGenericClass()])
    println("s.apply(instance, [114514]) as Int64 = ${s.apply(instance, [114514]) as Int64}")
}

public func testClassInstanceProperty(): Unit {
    println("测试泛型class的泛型实例属性")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let instance = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
        .apply([111, "hello", NonGenericClass()])
    let instanceProperty = c.getInstanceProperty("p0")
    println("读属性")
    println("instanceProperty.getValue(instance) = ${instanceProperty.getValue(instance) as Int64}")
    println("写属性")
    instanceProperty.setValue(instance, 666)
    println("再次读属性")
    println("instanceProperty.getValue(instance) = ${instanceProperty.getValue(instance) as Int64}")
}

public func testClassInstanceVariable(): Unit {
    println("测试泛型class的泛型实例变量")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let i = c.getInstanceVariable("v0")
    let instance = GenericClass<Int64, String, NonGenericClass>(114514, "hello", NonGenericClass())
    println("读取泛型实例成员变量")
    println("v0 = ${(i.getValue(instance) as Int64)}")
    println("写入泛型实例成员变量")
    i.setValue(instance, 666)
    println("再次读取泛型实例成员变量")
    println("v0 = ${(i.getValue(instance) as Int64)}")
}

public func testClassInstanceFunction(): Unit {
    let tp = ClassTypeInfo.get(
        "test0.GenericClassWithConstraints<Int64,test0.GenericClassWithConstraints<Int64,String,Bool>,test0.NonGenericClass>"
    )
    let c = tp.getConstructor()
    let instance = c.apply()
    let foo = tp.getInstanceFunction("foo")
    let insta = tp.getInstanceFunction("instanceMemberFunction",
        [TypeInfo.of<Int64>(), TypeInfo.get("test0.GenericClassWithConstraints<Int64,String,Bool>"),
            TypeInfo.get("test0.NonGenericClass")])
    foo.apply(instance, [])
    let ins = tp.getInstanceFunction("instanceMemberFunction",
        [TypeInfo.of<S<Int64>>(), TypeInfo.of<Array<GenericClassWithConstraints<Int64, String, Bool>>>()])
    let r = ins.apply(instance,
        [StructTypeInfo.get("test0.S<Int64>").getConstructor([TypeInfo.of<Int64>()]).apply([666])])
    let intVa = (r as Int64).getOrThrow()
    println("intVa = ${intVa}")
    let result = insta.apply(instance,
        [114514, ClassTypeInfo.get("test0.GenericClassWithConstraints<Int64,String,Bool>").getConstructor().apply(),
            ClassTypeInfo.get("test0.NonGenericClass").getConstructor().apply()])
    let intvalue = (result as Int64).getOrThrow()
    println("intvalue = ${intvalue}")
    ClassTypeInfo.get("test0.NonGenericClass").name |> println
    PackageInfo.get("test0").name |> println
    TypeInfo.get("test0.NonGenericClass").name |> println
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
    // testGenricFunc()
    testClass()
    // testStruct()
}
