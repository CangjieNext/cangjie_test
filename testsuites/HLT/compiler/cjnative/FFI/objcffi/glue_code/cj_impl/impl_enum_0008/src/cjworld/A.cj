/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public enum A {
    | E1

    public func getB(a: Bool) { println("in cj enum, ${a}") }
    public func getU8(a: UInt8) { println("in cj enum, ${a}") }
    public func getU16(a: UInt16) { println("in cj enum, ${a}") }
    public func getU32(a: UInt32) { println("in cj enum, ${a}") }
    public func getU64(a: UInt64) { println("in cj enum, ${a}") }
    public func getUN(a: UIntNative) { println("in cj enum, ${a}") }
    public func getF32(a: Float32) { println("in cj enum, ${a}") }
    public func getF64(a: Float64) { println("in cj enum, ${a}") }

    public static func stGetB(a: Bool) { println("in cj enum st, ${a}") }
    public static func stGetU8(a: UInt8) { println("in cj enum st, ${a}") }
    public static func stGetU16(a: UInt16) { println("in cj enum st, ${a}") }
    public static func stGetU32(a: UInt32) { println("in cj enum st, ${a}") }
    public static func stGetU64(a: UInt64) { println("in cj enum st, ${a}") }
    public static func stGetUN(a: UIntNative) { println("in cj enum st, ${a}") }
    public static func stGetF32(a: Float32) { println("in cj enum st, ${a}") }
    public static func stGetF64(a: Float64) { println("in cj enum st, ${a}") }
}
