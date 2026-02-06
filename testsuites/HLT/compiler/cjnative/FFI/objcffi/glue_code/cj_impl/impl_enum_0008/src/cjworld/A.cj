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

    public func fB(a: Bool) { println("in cj enum, ${a}") }
    public func f8(a: UInt8) { println("in cj enum, ${a}") }
    public func f16(a: UInt16) { println("in cj enum, ${a}") }
    public func f32(a: UInt32) { println("in cj enum, ${a}") }
    public func f64(a: UInt64) { println("in cj enum, ${a}") }
    public func fN(a: UIntNative) { println("in cj enum, ${a}") }
    public func ff32(a: Float32) { println("in cj enum, ${a}") }
    public func ff64(a: Float64) { println("in cj enum, ${a}") }

    public static func stfB(a: Bool) { println("in cj enum st, ${a}") }
    public static func stf8(a: UInt8) { println("in cj enum st, ${a}") }
    public static func stf16(a: UInt16) { println("in cj enum st, ${a}") }
    public static func stf32(a: UInt32) { println("in cj enum st, ${a}") }
    public static func stf64(a: UInt64) { println("in cj enum st, ${a}") }
    public static func stfN(a: UIntNative) { println("in cj enum st, ${a}") }
    public static func stff32(a: Float32) { println("in cj enum st, ${a}") }
    public static func stff64(a: Float64) { println("in cj enum st, ${a}") }
}
