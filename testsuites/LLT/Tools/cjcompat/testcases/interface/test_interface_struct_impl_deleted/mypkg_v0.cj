// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
interface I {
    mut func f(): Unit
}

interface I2 {
}

public struct Foo <: I & I2 {
    var i = 0

    public mut func f(): Unit {
        i += 1
    }
}

main() {}