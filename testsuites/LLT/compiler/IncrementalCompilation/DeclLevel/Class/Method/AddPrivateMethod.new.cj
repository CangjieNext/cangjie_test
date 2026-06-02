open class A {
    protected open func foo(a: Int64) {1}
}

open class B <: A {
    private func goo(a: Int64) {0}
}

class C <: B {}

main() {
    C().foo(1)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
