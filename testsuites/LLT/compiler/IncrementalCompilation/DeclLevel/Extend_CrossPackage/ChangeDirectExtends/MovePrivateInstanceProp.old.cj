package inc

public class A {}
public interface I1 {
    func foo(): Int64
}

extend A {
    public func foo(): Int64 {
        1
    }
    public prop k: Int64 {
        get() {
            2
        }
    }
}

extend A <: I1 {}

main() {
    let a = A()
    a.k - a.foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
