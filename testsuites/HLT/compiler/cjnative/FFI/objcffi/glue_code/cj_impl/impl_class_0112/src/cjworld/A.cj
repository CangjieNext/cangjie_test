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
    public static func f() {
        println("in cj")
    }

    public static func fBool(p1: Bool) { p1 }
    public static func f8(p1: Int8) { p1 }
    public static func f16(p1: Int16) { p1 }
    public static func f32(p1: Int32) { p1 }
    public static func f64(p1: Int64) { p1 }
    public static func fN(p1: IntNative) { p1 }

    public static func fU8(p1: UInt8) { p1 }
    public static func fU16(p1: UInt16) { p1 }
    public static func fU32(p1: UInt32) { p1 }
    public static func fU64(p1: UInt64) { p1 }
    public static func fUN(p1: UIntNative) { p1 }

    public static func ff32(p1: Float32) { p1 }
    public static func ff64(p1: Float64) { p1 }
}
