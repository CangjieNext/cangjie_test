open class A {
    A(a: Int64, protected var b: Int64) { }
}
class B <: A {
    var c: Int64 = 1
    init(a: Int64, b: Int64) {
        super(a, b)
    }
    func foo(): Int64 { b - c }
}

main(): Int64 {
    let b = B(2, 3)
    return b.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
