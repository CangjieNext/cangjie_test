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
    public open func getBool(p1: Bool) { p1 }
    public open func getI8(p1: Int8) { p1 }
    public open func getI16(p1: Int16) { p1 }
    public open func getI32(p1: Int32) { p1 }
    public open func getI64(p1: Int64) { p1 }
    public open func getIN(p1: IntNative) { p1 }

    public open func getU8(p1: UInt8) { p1 }
    public open func getU16(p1: UInt16) { p1 }
    public open func getU32(p1: UInt32) { p1 }
    public open func getU64(p1: UInt64) { p1 }
    public open func getUN(p1: UIntNative) { p1 }

    public open func getf32(p1: Float32) { p1 }
    public open func getf64(p1: Float64) { p1 }

    public func testOverridden(): Unit {
        println("CJ: overridden a.getBool ${getBool(true)}")
        println("CJ: overridden a.getI8 ${getI8(8)}")
        println("CJ: overridden a.getI16 ${getI16(16)}")
        println("CJ: overridden a.getI32 ${getI32(32)}")
        println("CJ: overridden a.getI64 ${getI64(64)}")
        println("CJ: overridden a.getIN ${getIN(128)}")
        println("CJ: overridden a.getU8 ${getU8(9)}")
        println("CJ: overridden a.getU16 ${getU16(17)}")
        println("CJ: overridden a.getU32 ${getU32(33)}")
        println("CJ: overridden a.getU64 ${getU64(65)}")
        println("CJ: overridden a.getUN ${getUN(129)}")
        println("CJ: overridden a.getf32 ${getf32(3.15)}")
        println("CJ: overridden a.getf64 ${getf64(3.14)}")
    }
}
