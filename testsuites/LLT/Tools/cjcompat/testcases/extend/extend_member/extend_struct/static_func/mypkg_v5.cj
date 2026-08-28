// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
    static func f0(): Int64 { 1 }
    static func f0(a:Int32): Int64 { 1 }
}

public struct S {
}

extend S {
    public func foo() { 1 }
}

extend S <: I0 {
}

interface I1 {
    static func f1(): Int64 { 1 }
}

interface I2 <: I1 {
    static func f2(): Int64 { 2 }
}

extend S <: I2 {
    public static func f3(): Int64 { 3 }
}
