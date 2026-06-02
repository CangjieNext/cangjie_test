/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public struct A {
    public func foo() {
        1
    }

    public func getUnit()            { println("in cangjie getUnit()") }
    public func getI8 (a: Int8)      { println("in cangjie getI8(${a})"); a }
    public func getI16(a: Int16)     { println("in cangjie getI16(${a})"); a }
    public func getI32(a: Int32)     { println("in cangjie getI32(${a})"); a }
    public func getI64(a: Int64)     { println("in cangjie getI64(${a})"); a }
    public func getIN (a: IntNative) { println("in cangjie getIN(${a})"); a }

    public func getUI8 (a: UInt8)      { println("in cangjie getUI8(${a})"); a }
    public func getUI16(a: UInt16)     { println("in cangjie getUI16(${a})"); a }
    public func getUI32(a: UInt32)     { println("in cangjie getUI32(${a})"); a }
    public func getUI64(a: UInt64)     { println("in cangjie getUI64(${a})"); a }
    public func getUIN (a: UIntNative) { println("in cangjie getUIN(${a})"); a }

    public func getBool(a: Bool)   { println("in cangjie getBool(${a})"); a }
    public func getF32(a: Float32) { println("in cangjie getF32(${a})"); a }
    public func getF64(a: Float64) { println("in cangjie getF64(${a})"); a }
}
