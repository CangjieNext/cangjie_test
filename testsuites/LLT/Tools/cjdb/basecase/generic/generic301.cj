// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    func foo<T>(a: T) {
        a
    }
}

main() {
    var aa = A()
    let bb: Float64 = 3.1
    aa.foo(bb)
    0
}
