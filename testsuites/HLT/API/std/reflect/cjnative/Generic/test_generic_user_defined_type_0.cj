/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (not MAC) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package test0

import std.reflect.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// 带有泛型约束的泛型class
public class GenericClassWithConstraints<T0, T1, T2> <: ToString where T1 <: ToString {
    public func toString(): String {
        "GenericClassWithConstraints<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>"
    }
    public func foo(): Unit {
        println("GenericClassWithConstraints<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println("instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
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

// 带有泛型约束的泛型struct
public struct GenericStructWithConstraints<T0, T1, T2> <: ToString where T1 <: ToString {
    public func toString(): String {
        "GenericStructWithConstraints<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>"
    }
    public func foo(): Unit {
        println("GenericStructWithConstraints<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()},${TypeInfo.of<T2>()}>.foo")
    }
    public func instanceMemberFunction(p0: T0, p1: T1, p2: T2): T0 {
        println(
            "GenericStructWithConstraints.instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)},${TypeInfo.of(p2)}")
        println("p1 = ${p1}")
        p0
    }
    public func instanceMemberFunction(p0: GenericStruct<T0, T1, T2>, p1: Array<T1>): T0 {
        println("GenericStructWithConstraints.instanceMemberFunction: ${TypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.v0
    }
    public func genericInstanceFunction<F0, F1>(p0: GenericClassWithConstraints<F0, Int64, F1>): Unit {
        println("GenericStructWithConstraints.genericInstanceFunction: ${ClassTypeInfo.of(p0)}")
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
    public static mut prop sp0: GenericStruct<String, Int64, Bool> {
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
    public static var sv0: GenericStruct<String, Int64, Bool> = GenericStruct<String, Int64, Bool>(
        "hello",
        114514,
        true
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
    public func instanceMemberFunction(p0: GenericStruct<T0, T1, T2>, p1: Array<T1>): T0 {
        println("GenericStruct.instanceMemberFunction: ${StructTypeInfo.of(p0)},${TypeInfo.of(p1)}")
        p0.v0
    }
    // 同时使用到类型泛型和函数泛型
    public func genericInstanceFunction<F0, F1>(p0: GenericStruct<F0, Int64, T0>): Int64 {
        println("genericInstanceFunction: ${StructTypeInfo.of(p0)}")
        114514
    }
    public static func staticMemberFunction(p0: T0, p1: GenericStruct<T0, T1, T2>): T1 {
        println("GenericStruct<${TypeInfo.of<T0>()}, ${TypeInfo.of<T1>()}, ${TypeInfo.of<T2>()}>")
        println("p0: ${TypeInfo.of(p0)}")
        println("p1: ${StructTypeInfo.of(p1)}")
        p1.v1
    }
    public static mut prop sp0: GenericStruct<String, Int64, Bool> {
        get() {
            println("GenericStruct.sp0.get")
            _sp0
        }
        set(v) {
            println("GenericStruct.sp0.set")
            _sp0 = v
        }
    }
    public static var _sp0: GenericStruct<String, Int64, Bool> = GenericStruct<String, Int64, Bool>("hello", 114514,
        true)
    public static var sv0: GenericStruct<String, Int64, Bool> = GenericStruct<String, Int64, Bool>("hello", 114514, true)
    public operator func +(p0: T0): T0 {
        p0
    }
}

public class NonGenericClass {}

public struct NonGenericStruct {}

@Test
public class TestClassType {
    @TestCase
    public func testClassGenricFunc(): Unit {
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let i = c
            .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
            .apply([111, "hello", NonGenericClass()])
        let r = c
            .getInstanceFunctions("genericInstanceFunction")[0]
            .apply(i, [TypeInfo.of<Int64>(), TypeInfo.of<String>()], [GenericClass<Int64, Int64, Int64>(1, 2, 3)])
        @Expect(r as Int64, Some(114514))
    }
    @TestCase
    public func testConstructClassWithUnmetGenericConstraint(): Unit {
        try {
            // 不满足泛型约束应找不到TypeInfo
            StructTypeInfo.get("test0.GenericClassWithConstraints<Int64,test0.NonGenericClass,test0.NonGenericStruct>")
            @Assert(false)
        } catch (e: InfoNotFoundException) {
            @Assert(true)
        }
    }
    @TestCase
    public func testClassInstanceFunction(): Unit {
        let tp = ClassTypeInfo.get(
            "test0.GenericClassWithConstraints<Int64,test0.GenericClassWithConstraints<Int64,String,Bool>,test0.NonGenericClass>")
        let c = tp.getConstructor()
        let instance = c.apply()
        let foo = tp.getInstanceFunction("foo")
        let insta = tp.getInstanceFunction("instanceMemberFunction",
            [TypeInfo.of<Int64>(), TypeInfo.get("test0.GenericClassWithConstraints<Int64,String,Bool>"),
                TypeInfo.get("test0.NonGenericClass")])
        foo.apply(instance, [])
        let ins = tp.getInstanceFunction("instanceMemberFunction",
            [TypeInfo.of<GenericStruct<Int64, GenericClassWithConstraints<Int64, String, Bool>, NonGenericClass>>(),
                TypeInfo.of<Array<GenericClassWithConstraints<Int64, String, Bool>>>()])
        let r = ins.apply(instance,
            [StructTypeInfo
                .get(
                    "test0.GenericStruct<Int64,test0.GenericClassWithConstraints<Int64,String,Bool>,test0.NonGenericClass>")
                .getConstructor(
                    [TypeInfo.of<Int64>(), TypeInfo.get("test0.GenericClassWithConstraints<Int64,String,Bool>"),
                        TypeInfo.get("test0.NonGenericClass")])
                .apply([666, GenericClassWithConstraints<Int64, String, Bool>(), NonGenericClass()]),
                Array<GenericClassWithConstraints<Int64, String, Bool>>()])
        @Expect((r as Int64).getOrThrow(), 666)
        let result = insta.apply(instance,
            [114514, ClassTypeInfo.get("test0.GenericClassWithConstraints<Int64,String,Bool>").getConstructor().apply(),
                ClassTypeInfo.get("test0.NonGenericClass").getConstructor().apply()])
        @Expect((result as Int64).getOrThrow(), 114514)
    }
    @TestCase
    public func testClassInstanceVariable(): Unit {
        println("测试泛型class的泛型实例变量")
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let i = c.getInstanceVariable("v0")
        let instance = GenericClass<Int64, String, NonGenericClass>(114514, "hello", NonGenericClass())
        println("读取泛型实例成员变量")
        println("写入泛型实例成员变量")
        @Expect(i.getValue(instance) as Int64, Some(114514))
        i.setValue(instance, 666)
        println("再次读取泛型实例成员变量")
        @Expect(i.getValue(instance) as Int64, Some(666))
    }
    @TestCase
    public func testClassInstanceProperty(): Unit {
        println("测试泛型class的泛型实例属性")
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let instance = c
            .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
            .apply([111, "hello", NonGenericClass()])
        let instanceProperty = c.getInstanceProperty("p0")
        println("读属性")
        @Expect(instanceProperty.getValue(instance) as Int64, 111)
        println("写属性")
        instanceProperty.setValue(instance, 666)
        println("再次读属性")
        @Expect(instanceProperty.getValue(instance) as Int64, 666)
    }
    @TestCase
    public func testClassOperatorFunc(): Unit {
        println("测试泛型class的操作符重载函数")
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let s = c.getInstanceFunction("+", [TypeInfo.of<Int64>()])
        let instance = c
            .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
            .apply([111, "hello", NonGenericClass()])
        @Expect(s.apply(instance, [114514]) as Int64, 114514)
    }

    @TestCase
    public func testClassStaticFunction(): Unit {
        println("测试泛型class的静态成员函数")
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let s = c.getStaticFunction("staticMemberFunction",
            [TypeInfo.of<Int64>(), TypeInfo.of<GenericStruct<Int64, String, NonGenericClass>>()])
        let result = s.apply(c, [114514, GenericStruct<Int64, String, NonGenericClass>(114514, "hello",
            NonGenericClass())]) as String
        @Expect(result, "hello")
    }

    @TestCase
    public func testClassStaticProperty(): Unit {
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let s = c.getStaticProperty("sp0")
        println("读静态属性")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 114514)
        println("写静态属性")
        s.setValue(GenericStruct("world", 2333, true))
        println("再次读静态属性")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 2333)
    }
    @TestCase
    public func testClassStaticVariable(): Unit {
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let s = c.getStaticVariable("sv0")
        println("读静态变量")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 114514)
        println("写静态变量")
        s.setValue(GenericStruct("world", 666, true))
        println("再次读静态变量")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 666)
    }
}

@Test
public class TestStructType {
    @TestCase
    public func testStructGenricFunc(): Unit {
        let c = ClassTypeInfo.get("test0.GenericClass<Int64,String,test0.NonGenericClass>")
        let i = c
            .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), ClassTypeInfo.of(NonGenericClass())])
            .apply([111, "hello", NonGenericClass()])
        let r = c
            .getInstanceFunctions("genericInstanceFunction")[0]
            .apply(i, [TypeInfo.of<Int64>(), TypeInfo.of<String>()], [GenericClass<Int64, Int64, Int64>(1, 2, 3)])
        @Expect(r as Int64, Some(114514))
    }
    @TestCase
    public func testConstructStructWithUnmetGenericConstraint(): Unit {
        try {
            StructTypeInfo.get(
                "test0.GenericStructWithConstraints<Int64,test0.NonGenericStruct,test0.NonGenericStruct>")
            @Assert(false)
        } catch (e: InfoNotFoundException) {
            @Assert(true)
        }
    }

    @TestCase
    public func testStructStaticFunction(): Unit {
        println("测试泛型struct的静态成员函数")
        let c = StructTypeInfo.get("test0.GenericStruct<Int64,String,test0.NonGenericStruct>")
        let s = c.getStaticFunction("staticMemberFunction",
            [TypeInfo.of<Int64>(), TypeInfo.of<GenericStruct<Int64, String, NonGenericStruct>>()])
        @Expect(
            s.apply(c, [114514, GenericStruct<Int64, String, NonGenericStruct>(114514, "hello", NonGenericStruct())]) as String,
            Some("hello"))
    }

    @TestCase
    public func testStructStaticProperty(): Unit {
        println("测试struct静态属性")
        let c = StructTypeInfo.get("test0.GenericStruct<Int64,String,test0.NonGenericStruct>")
        let s = c.getStaticProperty("sp0")
        println("读静态属性")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 114514)
        println("写静态属性")
        s.setValue(GenericStruct("world", 666, true))
        println("再次读静态属性")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 666)
    }

    @TestCase
    public func testStructStaticVariable(): Unit {
        println("测试struct静态变量")
        let c = StructTypeInfo.get("test0.GenericStruct<Int64,String,test0.NonGenericStruct>")
        let s = c.getStaticVariable("sv0")
        println("读静态变量")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 114514)
        println("写静态变量")
        s.setValue(GenericStruct("world", 666, true))
        println("再次读静态变量")
        @Expect((s.getValue() as GenericStruct<String, Int64, Bool>).getOrThrow().v1, 666)
    }

    @TestCase
    public func testStructOperatorFunc(): Unit {
        println("测试泛型struct的操作符重载函数")
        let c = StructTypeInfo.get("test0.GenericStruct<Int64,String,test0.NonGenericStruct>")
        let s = c.getInstanceFunction("+", [TypeInfo.of<Int64>()])
        let instance = c
            .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), StructTypeInfo.of(NonGenericStruct())])
            .apply([111, "hello", NonGenericStruct()])
        @Expect(s.apply(instance, [114514]) as Int64, Some(114514))
    }

    @TestCase
    public func testStructInstanceProperty(): Unit {
        println("测试泛型struct的泛型实例属性")
        let c = StructTypeInfo.get("test0.GenericStruct<Int64,String,test0.NonGenericStruct>")
        let instance = c
            .getConstructor([TypeInfo.of<Int64>(), TypeInfo.of<String>(), StructTypeInfo.of(NonGenericStruct())])
            .apply([111, "hello", NonGenericStruct()])
        let instanceProperty = c.getInstanceProperty("p0")
        println("读属性")
        @Expect(instanceProperty.getValue(instance) as Int64, Some(111))
        println("写属性")
        instanceProperty.setValue(instance, 666)
        println("再次读属性")
        @Expect(instanceProperty.getValue(instance) as Int64, Some(666))
    }

    @TestCase
    public func testStructInstanceVariable(): Unit {
        println("测试泛型struct的泛型实例变量")
        let c = StructTypeInfo.get("test0.GenericStruct<Int64,String,test0.NonGenericStruct>")
        let i = c.getInstanceVariable("v0")
        var _instance = GenericStruct<Int64, String, NonGenericStruct>(114514, "hello", NonGenericStruct())
        let instance: Any = _instance
        println("读取泛型实例成员变量")
        @Expect(i.getValue(instance) as Int64, Some(114514))
        println("写入泛型实例成员变量")
        i.setValue(instance, 666)
        _instance = (instance as GenericStruct<Int64, String, NonGenericStruct>).getOrThrow()
        println("再次读取泛型实例成员变量")
        @Expect(_instance.v0, 666)
    }

    @TestCase
    public func testStructInstanceFunction(): Unit {
        let tp = StructTypeInfo.get(
            "test0.GenericStructWithConstraints<Int64,test0.GenericStructWithConstraints<Int64,String,Bool>,test0.NonGenericStruct>")
        let c = tp.getConstructor()
        let instance = c.apply()
        let foo = tp.getInstanceFunction("foo")
        let insta = tp.getInstanceFunction("instanceMemberFunction",
            [TypeInfo.of<Int64>(), TypeInfo.get("test0.GenericStructWithConstraints<Int64,String,Bool>"),
                TypeInfo.get("test0.NonGenericStruct")])
        foo.apply(instance, [])
        let ins = tp.getInstanceFunction("instanceMemberFunction",
            [TypeInfo.of<GenericStruct<Int64, GenericStructWithConstraints<Int64, String, Bool>, NonGenericStruct>>(),
                TypeInfo.of<Array<GenericStructWithConstraints<Int64, String, Bool>>>()])
        let r = ins.apply(instance,
            [StructTypeInfo
                .get(
                    "test0.GenericStruct<Int64,test0.GenericStructWithConstraints<Int64,String,Bool>,test0.NonGenericStruct>")
                .getConstructor(
                    [TypeInfo.of<Int64>(), TypeInfo.of<GenericStructWithConstraints<Int64, String, Bool>>(),
                        TypeInfo.of<NonGenericStruct>()])
                .apply([666, GenericStructWithConstraints<Int64, String, Bool>(), NonGenericStruct()]),
                Array<GenericStructWithConstraints<Int64, String, Bool>>()])
        @Expect((r as Int64).getOrThrow(), 666)
        let result = insta.apply(instance,
            [114514,
                StructTypeInfo.get("test0.GenericStructWithConstraints<Int64,String,Bool>").getConstructor().apply(),
                StructTypeInfo.get("test0.NonGenericStruct").getConstructor().apply()])
        @Expect((result as Int64).getOrThrow(), 114514)
    }
}

@Test
public class TestPackageInfo {
    @TestCase
    func test00(): Unit {
        @Expect(PackageInfo.get("test0").name, "test0")
        @Expect(PackageInfo.get("test0").qualifiedName, "test0")
        @Expect(PackageInfo.get("test0").organizationName, "")
    }
}
