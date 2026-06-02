/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
package test3.aa.bb.cc.dd.test

// 基础数据类型
public var int8: Int8 = 12
public var int16: Int16 = 12
public var int32: Int32 = 12
public var int64: Int64 = 12
public var intNative: IntNative = 12
public var uint8: UInt8 = 12
public var uint16: UInt16 = 12
public var uint32: UInt32 = 12
public var uint64: UInt64 = 12
public var uintNative: UIntNative = 12

// 类数据类型
public class C0 {}
// 
public open class C1 {}
// 
public abstract open class C4 {}

// 包内可见的抽象类
public abstract sealed open class C2 {}
// 单继承
public open class C3 <: C1 {}

// 接口数据类型
// 空的
public interface I0 {}

public interface I1 {}

public interface I2 {}

func a(): Int64 {
    var a_a = 1
    var a_b = 2
    return a_a + a_b
}

func b(): Unit {}

public func c(): Int64 {
    var c_a = 1
    var c_b = 2
    return c_a + c_b
}

public func d(): Unit {}

public class Foo1 {}

class Foo2 {}

class Foo3 {}

class Foo4 {}
