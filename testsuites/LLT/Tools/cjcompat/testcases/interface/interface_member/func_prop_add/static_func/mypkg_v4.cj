// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public interface I {
    static func foo1() { 1 }
}

interface I1 {
    static func f1() { 1 }
    static func f2(): Int64
}
public interface I2 <: I1 {
    static redef func f1() { 2 }
}