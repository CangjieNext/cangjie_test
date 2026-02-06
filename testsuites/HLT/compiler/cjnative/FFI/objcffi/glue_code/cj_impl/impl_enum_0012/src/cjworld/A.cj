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

    public func fB(): Bool {true}
    public func fu8(): UInt8 {8}
    public func fu16(): UInt16 {16}
    public func fu32(): UInt32 {32}
    public func fu64(): UInt64 {64}
    public func fuN(): UIntNative {128}
    public func ff32(): Float32 {3.15}
    public func ff64(): Float64 {3.14}

    public func implicitB() {true}
    public func implicitu8() {UInt8(8)}
    public func implicitu16() {UInt16(16)}
    public func implicitu32() {UInt32(32)}
    public func implicitu64() {UInt64(64)}
    public func implicituN() {UIntNative(128)}
    public func implicitf32() {Float32(3.15)}
    public func implicitf64() {Float64(3.14)}

    public static func stfB(): Bool {true}
    public static func stfu8(): UInt8 {8}
    public static func stfu16(): UInt16 {16}
    public static func stfu32(): UInt32 {32}
    public static func stfu64(): UInt64 {64}
    public static func stfuN(): UIntNative {128}
    public static func stff32(): Float32 {3.15}
    public static func stff64(): Float64 {3.14}
}
