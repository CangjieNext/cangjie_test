package inc

public open class A {
    public static func foo(): Int64 {
        2
    }
}

public class B <: A {}

public interface I1 {
    static func foo(): Int64 {
        1
    }
}

extend B <: I1 {}

main() {
    B.foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
