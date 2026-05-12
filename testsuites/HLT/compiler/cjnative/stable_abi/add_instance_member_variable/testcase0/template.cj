/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

import std.reflect.*

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

// 非泛型class
public class NonGenericClass <: NonGenericInterface {
    public let v: Int64 = 666
}
// 泛型class
public class GenericClass<T0, T1, T2> <: GenericInterface<T1, T2, T0> {
    public let v: Int64 = 123
}
// 非泛型enum
public enum NonGenericEnum {
    | A
    | B(Int64, String, Bool)
}
// 泛型enum
public enum GenericEnum<T0, T1, T2> {
    | A
    | B(T1, T2, T0)
}
// 非泛型struct
public struct NonGenericStruct {
    public let v: Int64 = 456
}
// 泛型struct
public struct GenericStruct<T0, T1, T2> {
    public let v: String = "hello"
}
// 非泛型interface
public interface NonGenericInterface {}
// 泛型interface
public interface GenericInterface<T0, T1, T2> {}

// class类型形参个数3
public class C<T0, T1, T2> {
    // 有多个实例成员变量，包含基础类型、用户自定义类型、类型形参
    public let v0: T0
    public var v1: T1
    public let v2: T2
    public var v3: Int64 = 114514
    public let v4: NonGenericClass = NonGenericClass()
    public let v5: GenericClass<T2, T0, T1> = GenericClass()
    public let v6: NonGenericEnum = NonGenericEnum.B(114514, "hello", true)
    public let v7: GenericEnum<T1, T2, T0>
    public var v8: NonGenericStruct = NonGenericStruct()
    public var v9: GenericStruct<T2, T1, T0> = GenericStruct()
    public var v10: NonGenericInterface = NonGenericClass()
    public var v11: GenericInterface<T0, T2, T1> = GenericClass()

    public init(v0: T0, v1: T1, v2: T2) {
        this.v0 = v0
        this.v1 = v1
        this.v2 = v2
        this.v7 = GenericEnum.B(v2, v0, v1)
    }
}

public func check<T0, T1, T2>(c: C<T0, T1, T2>): Unit {
    println("c: ${TypeInfo.of(c)}")
    println("c.v0: ${TypeInfo.of(c.v0)}")
    println("c.v1: ${TypeInfo.of(c.v1)}")
    println("c.v2: ${TypeInfo.of(c.v2)}")
    println("c.v3: ${TypeInfo.of(c.v3)}")
    assert(c.v3, 114514)
    println("c.v4: ${TypeInfo.of(c.v4)}")
    println("c.v5: ${TypeInfo.of(c.v5)}")
    assert(c.v5.v, 123)
    println("c.v6: ${TypeInfo.of(c.v6)}")
    assert(match (c.v6) {
        case B(a, b, c) => true
        case A => false
    }, true)
    println("c.v7: ${TypeInfo.of(c.v7)}")
    assert(match (c.v7) {
        case B(a, b, c) => true
        case A => false
    }, true)
    println("c.v8: ${TypeInfo.of(c.v8)}")
    println("c.v9: ${TypeInfo.of(c.v9)}")
    assert(c.v8.v, 456)
    println("c.v10: ${TypeInfo.of(c.v10)}")
    println("c.v11: ${TypeInfo.of(c.v11)}")
}
