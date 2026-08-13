// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
    static func f0(): Int64
}

public class C0 {
    public static func foo() {}
}

interface I1 {
    static func f1(): Int64 { 0 }
}

public class C1 <: I1 {
    public static func foo() {}
}

interface I2 <: I0 {
    static func f2(): Int64 { 0 }
}

public class C2 {
    public static func foo() {}
}
