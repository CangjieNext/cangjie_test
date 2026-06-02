// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct S<T> {
    var a: Int8 = 3
    var b: T
    var c: String = "hhh"

    init(para: T) {
        b = para
    }

    mut func foo(para: T) {
        b = para
        return 0
    }
}

main() {
    var a = S<Int8>(4)
    a.foo(5)
    0
}
