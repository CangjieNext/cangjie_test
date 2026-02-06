/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public open class A {
    public open func fBool(p1: Bool) { p1 }
    public open func f8(p1: Int8) { p1 }
    public open func f16(p1: Int16) { p1 }
    public open func f32(p1: Int32) { p1 }
    public open func f64(p1: Int64) { p1 }
    public open func fN(p1: IntNative) { p1 }

    public open func fU8(p1: UInt8) { p1 }
    public open func fU16(p1: UInt16) { p1 }
    public open func fU32(p1: UInt32) { p1 }
    public open func fU64(p1: UInt64) { p1 }
    public open func fUN(p1: UIntNative) { p1 }

    public open func ff32(p1: Float32) { p1 }
    public open func ff64(p1: Float64) { p1 }

    public func testOverridden(): Unit {
        println("CJ: overridden a.fBool ${fBool(true)}")
        println("CJ: overridden a.f8 ${f8(8)}")
        println("CJ: overridden a.f16 ${f16(16)}")
        println("CJ: overridden a.f32 ${f32(32)}")
        println("CJ: overridden a.f64 ${f64(64)}")
        println("CJ: overridden a.fN ${fN(128)}")
        println("CJ: overridden a.fU8 ${fU8(9)}")
        println("CJ: overridden a.fU16 ${fU16(17)}")
        println("CJ: overridden a.fU32 ${fU32(33)}")
        println("CJ: overridden a.fU64 ${fU64(65)}")
        println("CJ: overridden a.fUN ${fUN(129)}")
        println("CJ: overridden a.ff32 ${ff32(3.15)}")
        println("CJ: overridden a.ff64 ${ff64(3.14)}")
    }
}
