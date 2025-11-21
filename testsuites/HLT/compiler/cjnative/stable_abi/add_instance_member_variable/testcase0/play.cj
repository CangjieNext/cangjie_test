/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.3
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: class modifier nonpublic to public
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
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
        this.new_v6 = (v2, v1, v0)
    }
    // 新增在末尾的实例成员变量定义
    // 泛型class
    public let new_v0 = GenericClass<T1, T2, T0>()
    // 非泛型class
    public let new_v1 = NonGenericClass()
    // 泛型enum
    public let new_v2 = GenericEnum.B(114514, "hello", true)
    // 泛型struct
    public let new_v3 = GenericStruct<T1, T0, T2>()
    // 泛型interface
    public var new_v4: GenericInterface<T1, T2, T0> = GenericClass<T0, T1, T2>()
    // 泛型函数
    public let new_v5: (T1, T2) -> (T2, T1) = {
        p1: T1, p2: T2 => (p2, p1)
    }
    // 泛型元组
    public let new_v6: (T2, T1, T0)
    // Array<T>
    public let new_v7: Array<T1> = []
}

public func check<T0, T1, T2>(c: C<T0, T1, T2>): Unit {
    // old
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
    // new
    println("c.new_v0: ${TypeInfo.of(c.new_v0)}")
    println("c.new_v1: ${TypeInfo.of(c.new_v1)}")
    println("c.new_v2: ${TypeInfo.of(c.new_v2)}")
    println("c.new_v3: ${TypeInfo.of(c.new_v3)}")
    println("c.new_v4: ${TypeInfo.of(c.new_v4)}")
    println("c.new_v5: ${TypeInfo.of(c.new_v5)}")
    println("c.new_v6[0]: ${TypeInfo.of(c.new_v6[0])}")
    println("c.new_v6[1]: ${TypeInfo.of(c.new_v6[1])}")
    println("c.new_v6[2]: ${TypeInfo.of(c.new_v6[2])}")
    println("c.new_v7: ${TypeInfo.of(c.new_v7)}")
}
