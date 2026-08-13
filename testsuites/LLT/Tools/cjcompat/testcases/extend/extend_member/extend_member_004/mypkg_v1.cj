// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public struct C1 {
    public func xoo(a: Int64) {
        a
    }
}

extend C1 {
    public func foo(x: Int64) : Float16 {
        if (x == 0) {
            1.0
        } else {
            2.0
        }
    }
}