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
    public let a: Int64 = 1

    public let a8: Int8 = 8
    public let a16: Int16 = 16
    public let a32: Int32 = 32
    public let a64: Int64 = 64
    public let aN: IntNative = 128

    public let u8: UInt8 = 9
    public let u16: UInt16 = 17
    public let u32: UInt32 = 33
    public let u64: UInt64 = 65
    public let uN: UIntNative = 129

    public let aB: Bool = true
    public let f32: Float32 = 3.15
    public let f64: Float64 = 3.14
}
