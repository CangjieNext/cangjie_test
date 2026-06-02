// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p2

internal import p1.*

class C {}

type c = C

extend c <: I {
    public func f() {
        2
    }
}

main() {
    var a = c()
    return a.f() - 2
}
