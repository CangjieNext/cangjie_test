// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A<T> {
    A(let a: T) {}
}

class B<T> <: A<Int64> {
    let b: Int64
    init(b: Int64) {
        super(30)
        this.b = b
    }

    init() {
        this(20)
    }
}


main() {
    var b = A<Int64>(1).a
    var a = B<Int64>()
    0
}
