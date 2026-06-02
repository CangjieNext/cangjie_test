// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p2

internal import p1.*

extend Foo { // 
    public func xxx() {
        return 0
    }
}

class B <: Foo {
    public func g() {
        return 1
    }
}

main() {
    let a = Foo()
    a.xxx()
    var b = B()
    b.g() - 1
}
