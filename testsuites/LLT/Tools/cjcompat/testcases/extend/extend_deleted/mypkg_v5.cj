// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public class C3 {
    C3(let x: Int64, let y: Float32) {}
}

extend C3 {
    public func foo(x: Int64) : Float16 {
        if (x == 0) {
            1.0
        } else {
            2.0
        }
    }
}

private class C2 {
    C2(let a : String, let b : Rune) {}
}

extend C2 {
    public func goo(x: Int8) : Rune {
        if (x == 0) {
            r'a'
        } else {
            r'b'
        }
    }
}