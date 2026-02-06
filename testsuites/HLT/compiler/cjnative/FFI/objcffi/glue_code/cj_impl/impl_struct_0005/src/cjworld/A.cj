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
    public init(a8: Int8) {
        println("in cangjie init(Int8), ${a8}")
    }
    public init(a16: Int16, a32: Int32) {
        println("in cangjie init(Int16, Int32), ${a16}, ${a32}")
    }
    public init(a: Int64, b: Float64, c: Bool) {
        println("in cangjie init, ${a}, ${b}, ${c}")
    }
    public init(u8: UInt8, u16: UInt16, u32: UInt32, u64: UInt64, n: IntNative, un: UIntNative, f32: Float32) {
        println("in cangjie init(UInt8, UInt16, UInt32, UInt64, IntNative, UIntNative, Float32), ${u8}, ${u16}, ${u32}, ${u64}, ${n}, ${un}, ${f32}")
    }

}
