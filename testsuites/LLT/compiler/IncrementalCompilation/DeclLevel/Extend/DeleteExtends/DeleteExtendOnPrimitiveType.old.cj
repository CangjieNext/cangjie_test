interface I1 {
    func foo() {println("I1 foo")}
}

extend Int64 <: I1 {
    public func foo() {println("extend foo")}
}

extend Int64 {
    public func goo() {1}
}

main() {
    let a = 3
    a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
