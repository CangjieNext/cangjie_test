// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V3
public struct A {
    static var i1 = 0
    static var i2:Int32 = 0
    static prop p1: Int32 {
        get() {
            i2
        }
    }
    @Frozen
    public static func f3() { p1 }
}