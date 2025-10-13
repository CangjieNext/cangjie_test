interface I1 {
    func foo() {1}
}
interface I2 {
    func foo() {-1}
}

enum E1 {
    R|K
}

extend E1 {
    public func foo() {3}
}

class A1 {}

extend A1 <: I1 {
    public func foo() {2}
}

main() {
    A1().foo() + E1.R.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
