// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I {
    static func goo(): Int64 { 0 }
    static prop area: Int64 {
        get() { 0 }
    }
    func foo(): Int64 { 1 }
    prop area2: Int64 {
        get() { 1 }
    }
}

public enum E <: I {
    Red
    public prop area2: Int64 {
        get() { 2 }
    }
}
