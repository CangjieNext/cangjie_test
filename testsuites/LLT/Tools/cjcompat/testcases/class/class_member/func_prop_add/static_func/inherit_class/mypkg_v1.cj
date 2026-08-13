// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
    static func f0(): Int64
}

interface I1 {
    static func f1(): Int64 { 0 }
}

public abstract class C0 {
    public static func cf0(): Int64 { 0 }
}

public open class C1 <: C0 {
    public static func cf1(): Int64 { 1 }
    public static func cf2(): Int64 { 2 }
}

public open class C2 <: I1 {
    public static func cf2(): Int64 { 2 }
}

public class C3 <: C2 {
    public static func cf3(): Int64 { 3 }
}
