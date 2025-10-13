package inc

public class A {}

extend A {
    public func bar() {
        1
    }
}

extend A {
    public func foo() {
        1
    }
}

main() {
    let a = A()
    a.bar() - a.foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
