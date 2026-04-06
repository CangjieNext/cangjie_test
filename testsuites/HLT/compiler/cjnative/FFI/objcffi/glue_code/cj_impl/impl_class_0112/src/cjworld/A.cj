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

    public static func getBool(p1: Bool) { p1 }
    public static func getI8(p1: Int8) { p1 }
    public static func getI16(p1: Int16) { p1 }
    public static func getI32(p1: Int32) { p1 }
    public static func getI64(p1: Int64) { p1 }
    public static func getIN(p1: IntNative) { p1 }

    public static func getU8(p1: UInt8) { p1 }
    public static func getU16(p1: UInt16) { p1 }
    public static func getU32(p1: UInt32) { p1 }
    public static func getU64(p1: UInt64) { p1 }
    public static func getUN(p1: UIntNative) { p1 }

    public static func getF32(p1: Float32) { p1 }
    public static func getF64(p1: Float64) { p1 }
}
