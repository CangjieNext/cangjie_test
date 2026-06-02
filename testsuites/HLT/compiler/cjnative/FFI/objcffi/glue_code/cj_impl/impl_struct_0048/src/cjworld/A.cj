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
    public static prop p: Int64 {
        get() {
            1
        }
    }

    public static var a8: Int8 = 8
    public static var a16: Int16 = 16
    public static var a32: Int32 = 32
    public static var a64: Int64 = 64
    public static var aN: IntNative = 128

    public static var u8: UInt8 = 9
    public static var u16: UInt16 = 17
    public static var u32: UInt32 = 33
    public static var u64: UInt64 = 65
    public static var uN: UIntNative = 129

    public static var aB: Bool = true
    public static var f32: Float32 = 3.15
    public static var f64: Float64 = 3.14

    public static prop p8: Int8 { get() { a8 } }
    public static prop p16: Int16 { get() { a16 } }
    public static prop p32: Int32 { get() { a32 } }
    public static prop p64: Int64 { get() { a64 } }
    public static prop pN: IntNative { get() { aN } }

    public static prop pu8: UInt8 { get() { u8 } }
    public static prop pu16: UInt16 { get() { u16 } }
    public static prop pu32: UInt32 { get() { u32 } }
    public static prop pu64: UInt64 { get() { u64 } }
    public static prop puN: UIntNative { get() { uN } }

    public static prop pB: Bool { get() { aB } }
    public static prop pf32: Float32 { get() { f32 } }
    public static prop pf64: Float64 { get() { f64 } }

    public static mut prop stp8: Int8 { get() { a8 } set(v) { a8 = v } }
    public static mut prop stp16: Int16 { get() { a16 } set(v) { a16 = v } }
    public static mut prop stp32: Int32 { get() { a32 } set(v) { a32 = v } }
    public static mut prop stp64: Int64 { get() { a64 } set(v) { a64 = v } }
    public static mut prop stpN: IntNative { get() { aN } set(v) { aN = v } }

    public static mut prop stu8: UInt8 { get() { u8 } set(v) { u8 = v } }
    public static mut prop stu16: UInt16 { get() { u16 } set(v) { u16 = v } }
    public static mut prop stu32: UInt32 { get() { u32 } set(v) { u32 = v } }
    public static mut prop stu64: UInt64 { get() { u64 } set(v) { u64 = v } }
    public static mut prop stuN: UIntNative { get() { uN } set(v) { uN = v } }

    public static mut prop stpB: Bool { get() { aB } set(v) { aB = v } }
    public static mut prop stpf32: Float32 { get() { f32 } set(v) { f32 = v } }
    public static mut prop stpf64: Float64 { get() { f64 } set(v) { f64 = v } }
}
