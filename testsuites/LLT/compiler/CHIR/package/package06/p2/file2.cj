// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p2

internal import p1.*

public class D <: B {
    protected func render(): Unit {
        println("render B")
    }

    protected func render1(): Unit {
        println("render D")
    }
}

main() {
    var b = D()
    b.renderB()
    return 0
}
