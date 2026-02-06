/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public interface I {
    public func f(a: Bool): Unit

    public func fBool(a: Bool): Bool
    public func fI8(a: Int8): Int8
    public func fI16(a: Int16): Int16
    public func fI32(a: Int32): Int32
    public func fI64(a: Int64): Int64
    public func fIN(a: IntNative): IntNative

    public func fUI8(a: UInt8): UInt8
    public func fUI16(a: UInt16): UInt16
    public func fUI32(a: UInt32): UInt32
    public func fUI64(a: UInt64): UInt64
    public func fUIN(a: UIntNative): UIntNative

    public func fF32(a: Float32): Float32
    public func fF64(a: Float64): Float64
}

public class Clz {
    public static func testI(a: I): Unit {
        println("in CJ got ${a.fBool(true)}")
        println("in CJ got ${a.fI8(8)}")
        println("in CJ got ${a.fI16(16)}")
        println("in CJ got ${a.fI32(32)}")
        println("in CJ got ${a.fI64(64)}")
        println("in CJ got ${a.fIN(128)}")

        println("in CJ got ${a.fUI8(9)}")
        println("in CJ got ${a.fUI16(17)}")
        println("in CJ got ${a.fUI32(33)}")
        println("in CJ got ${a.fUI64(65)}")
        println("in CJ got ${a.fUIN(129)}")

        println("in CJ got ${a.fF32(3.15)}")
        println("in CJ got ${a.fF64(3.14)}")
    }
}