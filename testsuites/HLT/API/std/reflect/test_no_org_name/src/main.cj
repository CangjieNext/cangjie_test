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
    public func instanceMemberFunction(p0: GenericStruct<T0, T1, T2>, p1: Array<T1>): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.v0
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
    public func instanceMemberFunction(p0: GenericStruct<T0, T1, T2>, p1: Array<T1>): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.v0
    }
    // 同时使用到类型泛型和函数泛型
    public func genericInstanceFunction<F0, F1>(p0: GenericClass<F0, Int64, T0>): Int64 {
        println("genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
        114514
    }
    public static func staticMemberFunction(p0: T0, p1: GenericStruct<T0, T1, T2>): T1 {
        println("GenericClass<${TypeInfo.of<T0>()}, ${TypeInfo.of<T1>()}, ${TypeInfo.of<T2>()}>")
        println("p0: ${TypeInfo.of(p0)}")
        println("p1: ${StructTypeInfo.of(p1)}")
        p1.v1
    }
    public mut static prop sp0: GenericStruct<String, Int64, Bool> {
        get() {
            println("GenericClass.sp0.get")
            _sp0
        }
        set(v) {
            println("GenericClass.sp0.set")
            _sp0 = v
        }
    }
    public static var _sp0: GenericStruct<String, Int64, Bool> = GenericStruct<String, Int64, Bool>("hello", 114514,
        true)
    public static var sv0: GenericStruct<String, Int64, Bool> = GenericStruct<String, Int64, Bool>("hello", 114514, true
    )
    public operator func +(p0: T0): T0 {
        p0
    }
}

public struct GenericStruct<T0, T1, T2> {
    public GenericStruct(public var v0: T0, public let v1: T1, public let v2: T2) {}
    public mut prop p0: T0 {
        get() {
            v0
        }
        set(v) {
            v0 = v
        }
    }
    public func foo(): Unit {
        println("GenericStruct<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("GenericStruct.instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        p0
    }
    public func instanceMemberFunction(p0: GenericClass<T0, T1, T2>, p1: Array<T1>): T0 {
        println("GenericStruct.instanceMemberFunction: ${ClassTypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.v0
    }
    // 同时使用到类型泛型和函数泛型
    public func genericInstanceFunction<F0, F1>(p0: GenericClass<F0, Int64, T0>): Int64 {
        println("genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
        114514
    }
    public static func staticMemberFunction(p0: T0, p1: GenericClass<T0, T1, T2>): T1 {
        println("GenericClass<${TypeInfo.of<T0>()}, ${TypeInfo.of<T1>()}, ${TypeInfo.of<T2>()}>")
        println("p0: ${TypeInfo.of(p0)}")
        println("p1: ${ClassTypeInfo.of(p1)}")
        p1.v1
    }
    public mut static prop sp0: GenericClass<String, Int64, Bool> {
        get() {
            println("GenericClass.sp0.get")
            _sp0
        }
        set(v) {
            println("GenericClass.sp0.set")
            _sp0 = v
        }
    }
    public static var _sp0: GenericClass<String, Int64, Bool> = GenericClass<String, Int64, Bool>("hello", 114514, true)
    public static var sv0: GenericClass<String, Int64, Bool> = GenericClass<String, Int64, Bool>("hello", 114514, true)
    public operator func +(p0: T0): T0 {
        p0
    }
}

public class NonGenericClass {}

public struct NonGenericStruct {}

public func testClass(): Unit {
    println("测试class")
    // BUG
    // testGenricFunc()
    println("实例成员")
    // BUG
    // testClassInstanceFunction()
    testClassInstanceVariable()
    testClassInstanceProperty()
    testClassOperatorFunc()
    println("静态成员")
    testClassStaticFunction()
    testClassStaticVariable()
    testClassStaticProperty()
}

public func testClassGenricFunc(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let i = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
        .apply([111, "hello", NonGenericClass()])
    let r = c
        .getInstanceFunctions("genericInstanceFunction")[0]
        .apply(i, [TypeInfo.of<Int64>(), TypeInfo.of<String>()], [GenericClass<Int64, Int64, Int64>(1, 2, 3)])
    (r as Int64) |> println
}

public func testClassStaticFunction(): Unit {
    println("测试泛型class的静态成员函数")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticFunction("staticMemberFunction",
        [TypeInfo.of<Int64>(), TypeInfo.of<GenericStruct<Int64, String, NonGenericClass>>()])
    let result = s.apply(c, [114514, GenericStruct<Int64, String, NonGenericClass>(114514, "hello", NonGenericClass())]) as String
    println("result = ${result}")
}

public func testClassStaticProperty(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticProperty("sp0")
    println("读静态属性")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
    println("写静态属性")
    s.setValue(GenericStruct("world", 114514, true))
    println("再次读静态属性")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
}

public func testClassStaticVariable(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticVariable("sv0")
    println("读静态变量")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
    println("写静态变量")
    s.setValue(GenericStruct("world", 114514, true))
    println("再次读静态变量")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
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
        [TypeInfo.of<GenericStruct<Int64, String, Bool>>(),
            TypeInfo.of<Array<GenericClassWithConstraints<Int64, String, Bool>>>()])
    let r = ins.apply(instance,
        [StructTypeInfo.get("test0.GenericStruct<Int64>").getConstructor([TypeInfo.of<Int64>()]).apply([666])])
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
    println("测试class")
    println("实例成员")
    testStructInstanceFunction()
    testStructInstanceVariable()
    testStructInstanceProperty()
    testStructOperatorFunc()
    println("静态成员")
    testStructStaticFunction()
    testStructStaticVariable()
    testStructStaticProperty()
}

public func testStructGenricFunc(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let i = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
        .apply([111, "hello", NonGenericClass()])
    let r = c
        .getInstanceFunctions("genericInstanceFunction")[0]
        .apply(i, [TypeInfo.of<Int64>(), TypeInfo.of<String>()], [GenericClass<Int64, Int64, Int64>(1, 2, 3)])
    (r as Int64) |> println
}

public func testStructStaticFunction(): Unit {
    println("测试泛型class的静态成员函数")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticFunction("staticMemberFunction",
        [TypeInfo.of<Int64>(), TypeInfo.of<GenericStruct<Int64, String, NonGenericClass>>()])
    let result = s.apply(c, [114514, GenericStruct<Int64, String, NonGenericClass>(114514, "hello", NonGenericClass())]) as String
    println("result = ${result}")
}

public func testStructStaticProperty(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticProperty("sp0")
    println("读静态属性")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
    println("写静态属性")
    s.setValue(GenericStruct("world", 114514, true))
    println("再次读静态属性")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
}

public func testStructStaticVariable(): Unit {
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getStaticVariable("sv0")
    println("读静态变量")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
    println("写静态变量")
    s.setValue(GenericStruct("world", 114514, true))
    println("再次读静态变量")
    println(
        "(s.getValue() as GenericStruct<String>).getOrThrow().v1 = ${(s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1}"
    )
}

public func testStructOperatorFunc(): Unit {
    println("测试泛型class的操作符重载函数")
    let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
    let s = c.getInstanceFunction("+", [TypeInfo.of<Int64>()])
    let instance = c
        .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
        .apply([111, "hello", NonGenericClass()])
    println("s.apply(instance, [114514]) as Int64 = ${s.apply(instance, [114514]) as Int64}")
}

public func testStructInstanceProperty(): Unit {
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

public func testStructInstanceVariable(): Unit {
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

public func testStructInstanceFunction(): Unit {
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
        [TypeInfo.of<GenericStruct<Int64, String, Bool>>(),
            TypeInfo.of<Array<GenericClassWithConstraints<Int64, String, Bool>>>()])
    let r = ins.apply(instance,
        [StructTypeInfo.get("test0.GenericStruct<Int64>").getConstructor([TypeInfo.of<Int64>()]).apply([666])])
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

main(): Unit {
    testClass()
    testStruct()
}
