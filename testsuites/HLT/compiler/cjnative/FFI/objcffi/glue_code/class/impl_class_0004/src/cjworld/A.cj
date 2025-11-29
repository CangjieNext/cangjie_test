/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public class B {
    public init() {
    }
    public func foo(p0: Float64): Float64 {
        println("B.foo p0 = ${p0}")
        p0 + 1.0
    }
}

public class A {
    public init() {
    }
    public func foo(p0: Float32): Float32 {
        println("A.foo p0 = ${p0}")
        p0 + 1.0
    }
}
