
public interface I0<T> {
    func foo1(): T

    func foo2(a!: T): T {
        foo1()
        return a
    }
}
public interface I1<T> <: I0<T> {
}

public class A {
    public var x: Float64 = 10.0

    public func f(): Float64 {
        x = 20.0
        return x
    }
}

extend A <: I1<Float64> {
    public func foo1(): Float64 {
        f()
    }
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
