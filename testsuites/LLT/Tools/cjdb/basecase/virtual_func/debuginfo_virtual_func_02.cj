// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class C1<T> {}
public struct S1<T> {}

public interface I1<T> {
    public func foo1(a: T): T
    public func foo2(a: C1<T>): C1<T>
    public func foo3(a: S1<T>): S1<T>
}

public class CA <: I1<Bool> {
    public func foo1(a: Bool): Bool {
        return a
    }
    public func foo2(a: C1<Bool>): C1<Bool> {
        return a
    }
    public func foo3(a: S1<Bool>): S1<Bool> {
        return a
    }
}

public interface I2<T> {
    public func foo1(a: T): T
}

public class CB <: I2<C1<Bool>> {
    public func foo1(a: C1<Bool>): C1<Bool> {
        return a
    }
}

main() {
    let obj1: I1<Bool> = CA()
    obj1.foo1(true)
    obj1.foo2(C1<Bool>())
    obj1.foo3(S1<Bool>())
    let obj2: I2<C1<Bool>> = CB()
    obj2.foo1(C1<Bool>())
    0
}