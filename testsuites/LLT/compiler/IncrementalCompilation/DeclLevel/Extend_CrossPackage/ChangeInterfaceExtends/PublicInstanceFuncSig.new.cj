package inc

public class A {}
public interface I1 {}

extend A <: I1 {
    public func foo(a: String): Int64 {
        1
    }
}

main(): Int64 {
    let a = A()
    a.foo("some")
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
