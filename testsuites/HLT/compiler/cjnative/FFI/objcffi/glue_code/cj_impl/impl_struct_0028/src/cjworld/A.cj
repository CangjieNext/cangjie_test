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
}
