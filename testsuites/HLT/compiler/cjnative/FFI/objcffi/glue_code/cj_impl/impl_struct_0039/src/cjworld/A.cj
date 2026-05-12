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
    public static const a: Int64 = 1

    public static const a8: Int8 = 8
    public static const a16: Int16 = 16
    public static const a32: Int32 = 32
    public static const a64: Int64 = 64
    public static const aN: IntNative = 128

    public static const u8: UInt8 = 9
    public static const u16: UInt16 = 17
    public static const u32: UInt32 = 33
    public static const u64: UInt64 = 65
    public static const uN: UIntNative = 129

    public static const aB: Bool = true
    public static const f32: Float32 = 3.15
    public static const f64: Float64 = 3.14
}
