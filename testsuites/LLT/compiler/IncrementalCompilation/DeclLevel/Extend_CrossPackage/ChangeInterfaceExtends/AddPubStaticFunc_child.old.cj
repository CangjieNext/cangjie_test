package inc

public open class A {}

extend A {
    public func foo(): Int64 {
        1
    }
}

main(): Int64 {
    let a = A()
    a.foo() - B.some()
}

public interface IChild {
    static func some() {
        -1
    }
}
public class B <: A & IChild {}
public interface I1 {}

extend A <: I1 {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
