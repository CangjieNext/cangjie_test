// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public class A {
    var i1 = 0
    var i2:Int32 = 0
}

extend A {
    public mut prop p1: Int32 {
        get() {
            i2
        }
        set(value) {
            i2 = value
        }
    }
}