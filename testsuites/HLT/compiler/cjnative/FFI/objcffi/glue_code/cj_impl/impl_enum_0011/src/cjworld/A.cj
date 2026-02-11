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

    public func f8(): Int8 {8}
    public func f16(): Int16 {16}
    public func f32(): Int32 {32}
    public func f64(): Int64 {64}
    public func fN(): IntNative {128}

    public func implicit8() {Int8(8)}
    public func implicit16() {Int16(16)}
    public func implicit32() {Int32(32)}
    public func implicit64() {Int64(64)}
    public func implicitN() {IntNative(128)}

    public static func stf8(): Int8 {8}
    public static func stf16(): Int16 {16}
    public static func stf32(): Int32 {32}
    public static func stf64(): Int64 {64}
    public static func stfN(): IntNative {128}
}
