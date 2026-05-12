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

    public func getI8(a: Int8) { println("in cj enum, ${a}") }
    public func getI16(a: Int16) { println("in cj enum, ${a}") }
    public func getI32(a: Int32) { println("in cj enum, ${a}") }
    public func getI64(a: Int64) { println("in cj enum, ${a}") }
    public func getIN(a: IntNative) { println("in cj enum, ${a}") }

    public static func stGetI8(a: Int8) { println("in cj enum st, ${a}") }
    public static func stGetI16(a: Int16) { println("in cj enum st, ${a}") }
    public static func stGetI32(a: Int32) { println("in cj enum st, ${a}") }
    public static func stGetI64(a: Int64) { println("in cj enum st, ${a}") }
    public static func stGetIN(a: IntNative) { println("in cj enum st, ${a}") }
}
