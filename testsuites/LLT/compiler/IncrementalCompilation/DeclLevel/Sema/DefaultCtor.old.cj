main() {}

struct A {
    var a: Int32 = 1
}
class B {
    var a: Int64 = 2
}

interface I {
    func foo() {2}
}

extend A <: I {
    public func foo() {1}
}
extend B <: I {
    public func bar() {a}
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
