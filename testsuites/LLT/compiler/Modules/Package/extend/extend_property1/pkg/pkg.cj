// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public class A<T> {}

public interface Foo {
    prop v1: Int64
}

extend<T> A<T> <: Foo {
    public prop v1: Int64 {
        get() {
            3
        }
    }
}

public open class A1<T> {
    public var z: String = "C"
}

extend<T> A1<T> {
    public mut prop f: String {
        get() {
            return z
        }
        set(v) {
            z = v
        }
    }

    public func g() {
        f = "X"
        return f
    }
}

public class B1<T> <: A1<T> {}
