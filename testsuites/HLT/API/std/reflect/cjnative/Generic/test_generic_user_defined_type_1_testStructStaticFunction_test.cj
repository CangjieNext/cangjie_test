/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package my_org::test0

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
public class TestStructType {
    @TestCase
    public func testStructStaticFunction(): Unit {
        println("测试泛型struct的静态成员函数")
        let c = StructTypeInfo.get("my_org::test0.GenericStruct<Int64,String,my_org::test0.NonGenericStruct>")
        let s = c.getStaticFunction("staticMemberFunction",
            [TypeInfo.of<Int64>(), TypeInfo.of<GenericStruct<Int64, String, NonGenericStruct>>()])
        @Expect(
            s.apply(c, [114514, GenericStruct<Int64, String, NonGenericStruct>(114514, "hello", NonGenericStruct())]) as String,
            Some("hello"))
    }
}
