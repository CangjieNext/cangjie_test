public open class A {}
public interface I2 {}

extend A {
    public func foo(): Int64 {1}
}

main(): Int64 {
    let a = A()
    let b: IChild = B()
    a.foo() - b.some()
}

public interface IChild {
    func some() {-1}
}
public class B <: A & IChild {
}

extend A <: I2 {
    public func some() {0}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
