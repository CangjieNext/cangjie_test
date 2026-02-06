/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public struct A {
    public func foo() {
        println("in cangjie foo1")
    }
    public func foo(a: Int64) {
        println("in cangjie foo2, ${a}")
    }
    public func foo(a16: Int16, a32: Int32) {
        println("in cangjie foo(Int16, Int32), ${a16}, ${a32}")
    }
    public func foo(a8: Int8, n: IntNative, un: UIntNative) {
        println("in cangjie foo(Int8, IntNative, UIntNative), ${a8}, ${n}, ${un}")
    }
    public func foo(u8: UInt8, u16: UInt16, u32: UInt32, u64: UInt64, f32: Float32) {
        println("in cangjie foo(UInt8, UInt16, UInt32, UInt64, Float32), ${u8}, ${u16}, ${u32}, ${u64}, ${f32}")
    }

    public func getI8 (a: Int8):  Int8  { println("in cangjie getI8(${a})"); a }
    public func getI16(a: Int16): Int16 { println("in cangjie getI16(${a})"); a }
    public func getI32(a: Int32): Int32 { println("in cangjie getI32(${a})"); a }
    public func getI64(a: Int64): Int64 { println("in cangjie getI64(${a})"); a }
    public func getIN (a: IntNative): IntNative { println("in cangjie getIN(${a})"); a }

    public func getUI8 (a: UInt8):  UInt8  { println("in cangjie getUI8(${a})"); a }
    public func getUI16(a: UInt16): UInt16 { println("in cangjie getUI16(${a})"); a }
    public func getUI32(a: UInt32): UInt32 { println("in cangjie getUI32(${a})"); a }
    public func getUI64(a: UInt64): UInt64 { println("in cangjie getUI64(${a})"); a }
    public func getUIN (a: UIntNative): UIntNative { println("in cangjie getUIN(${a})"); a }

    public func getBool(a: Bool): Bool { println("in cangjie getBool(${a})"); a }
    public func getF32(a: Float32): Float32 { println("in cangjie getF32(${a})"); a }
    public func getF64(a: Float64): Float64 { println("in cangjie getF64(${a})"); a }
}
