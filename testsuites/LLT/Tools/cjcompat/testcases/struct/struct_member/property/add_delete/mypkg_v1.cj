// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public struct A {
    var i1 = 0
    mut prop p1: Int64 {
        get() {
            i1
        }
        set(value) {
            i1 = value
        }
    }
    public mut prop p2: Int64 {
        get() {
            i1
        }
        set(value) {
            i1 = value
        }
    }
}