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
    public var a = 1

    public var a8 = Int8(8)
    public var a16 = Int16(16)
    public var a32 = Int32(32)
    public var a64 = Int64(64)
    public var aN = IntNative(128)

    public var u8 = UInt8(9)
    public var u16 = UInt16(17)
    public var u32 = UInt32(33)
    public var u64 = UInt64(65)
    public var uN = UIntNative(129)

    public var aB = true
    public var f32 = Float32(3.15)
    public var f64 = Float64(3.14)
}
