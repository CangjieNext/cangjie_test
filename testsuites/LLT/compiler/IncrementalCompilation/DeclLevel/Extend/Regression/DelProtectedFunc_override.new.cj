open class A {
    protected open func foo() {1}
}

open class B <: A {
    // protected func foo() {2}
}

class C <: B {}

main() {
    let a: A = C()
    a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
