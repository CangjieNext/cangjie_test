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
    public static var a: Int64 = 1

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
}
