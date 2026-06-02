// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

import define.*

@M
public class A {
    public func foo<T>(a: T) {
        a
    }
}

public class B {
    @M
    public func test<T>(b: T) {
        b
    }
}

@M
public struct C {
    public func foo<T>(c: T) {
        c
    }
}

public struct D {
    @M
    public func test<T>(d: T) {
        d
    }
}
