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
    public var a: Int64 = 1
    public mut prop p: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }

    public var a8: Int8 = 8
    public var a16: Int16 = 16
    public var a32: Int32 = 32
    public var a64: Int64 = 64
    public var aN: IntNative = 128

    public var u8: UInt8 = 9
    public var u16: UInt16 = 17
    public var u32: UInt32 = 33
    public var u64: UInt64 = 65
    public var uN: UIntNative = 129

    public var aB: Bool = true
    public var f32: Float32 = 3.15
    public var f64: Float64 = 3.14

    public mut prop p8: Int8 { get() { a8 } set(v) { a8 = v } }
    public mut prop p16: Int16 { get() { a16 } set(v) { a16 = v } }
    public mut prop p32: Int32 { get() { a32 } set(v) { a32 = v } }
    public mut prop p64: Int64 { get() { a64 } set(v) { a64 = v } }
    public mut prop pN: IntNative { get() { aN } set(v) { aN = v } }

    public mut prop pu8: UInt8 { get() { u8 } set(v) { u8 = v } }
    public mut prop pu16: UInt16 { get() { u16 } set(v) { u16 = v } }
    public mut prop pu32: UInt32 { get() { u32 } set(v) { u32 = v } }
    public mut prop pu64: UInt64 { get() { u64 } set(v) { u64 = v } }
    public mut prop puN: UIntNative { get() { uN } set(v) { uN = v } }

    public mut prop pB: Bool { get() { aB } set(v) { aB = v } }
    public mut prop pf32: Float32 { get() { f32 } set(v) { f32 = v } }
    public mut prop pf64: Float64 { get() { f64 } set(v) { f64 = v } }

}
