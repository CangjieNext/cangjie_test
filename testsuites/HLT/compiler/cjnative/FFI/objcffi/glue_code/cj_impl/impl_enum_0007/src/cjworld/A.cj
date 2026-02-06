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

    public func f8(a: Int8) { println("in cj enum, ${a}") }
    public func f16(a: Int16) { println("in cj enum, ${a}") }
    public func f32(a: Int32) { println("in cj enum, ${a}") }
    public func f64(a: Int64) { println("in cj enum, ${a}") }
    public func fN(a: IntNative) { println("in cj enum, ${a}") }

    public static func stf8(a: Int8) { println("in cj enum st, ${a}") }
    public static func stf16(a: Int16) { println("in cj enum st, ${a}") }
    public static func stf32(a: Int32) { println("in cj enum st, ${a}") }
    public static func stf64(a: Int64) { println("in cj enum st, ${a}") }
    public static func stfN(a: IntNative) { println("in cj enum st, ${a}") }
}
