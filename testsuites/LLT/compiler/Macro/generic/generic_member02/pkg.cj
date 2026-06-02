// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

import define.*

@M0
public class A {
    public func foo<T>(a: T) {
        a
    }
}

public class B {
    @M0
    public func test<T>(b: T) {
        b
    }
}

@M0
public struct C {
    public func foo<T>(c: T) {
        c
    }
}

public struct D {
    @M0
    public func test<T>(d: T) {
        d
    }
}
