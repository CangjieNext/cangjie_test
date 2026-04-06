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
    public var a: Int64 = 1;
    public mut func foo() {
        a = 2
        println("in cangjie foo, ${a}")
    }

    public mut func getI8 (a: Int8):  Int8  { println("in cangjie getI8(${a})"); this.a = 2; a }
    public mut func getI16(a: Int16): Int16 { println("in cangjie getI16(${a})"); this.a = 2; a }
    public mut func getI32(a: Int32): Int32 { println("in cangjie getI32(${a})"); this.a = 2; a }
    public mut func getI64(a: Int64): Int64 { println("in cangjie getI64(${a})"); this.a = 2; a }
    public mut func getIN (a: IntNative): IntNative { println("in cangjie getIN(${a})"); this.a = 2; a }

    public mut func getUI8 (a: UInt8):  UInt8  { println("in cangjie getUI8(${a})"); this.a = 2; a }
    public mut func getUI16(a: UInt16): UInt16 { println("in cangjie getUI16(${a})"); this.a = 2; a }
    public mut func getUI32(a: UInt32): UInt32 { println("in cangjie getUI32(${a})"); this.a = 2; a }
    public mut func getUI64(a: UInt64): UInt64 { println("in cangjie getUI64(${a})"); this.a = 2; a }
    public mut func getUIN (a: UIntNative): UIntNative { println("in cangjie getUIN(${a})"); this.a = 2; a }

    public mut func getBool(a: Bool): Bool { println("in cangjie getBool(${a})"); this.a = 2; a }
    public mut func getF32(a: Float32): Float32 { println("in cangjie getF32(${a})"); this.a = 2; a }
    public mut func getF64(a: Float64): Float64 { println("in cangjie getF64(${a})"); this.a = 2; a }
}
