open class A {
}

interface I1 {}

open class B <: A {
    public func foo(a: Int32) {2}
}

extend B <: I1 {
    func bar(): Int64 {
        foo(6)
    }
}

main() {
    B().bar()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
