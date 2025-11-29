/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public class A {
    public A(public let value: Int64) {
    }
    public func foo(p0: Int64): A {
        println("A.foo")
        println("p0 = ${p0}")
        A(p0)
    }
    public func getValue(): Int64 {
        this.value
    }
}
