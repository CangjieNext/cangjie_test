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
    public let value: Int8
    public init(value: Int8) {
        println("A.init")
        println("value = ${value}")
        this.value = value
    }
    public func foo(p0: Int8): A {
        println("A.foo")
        println("p0 = ${p0}")
        A(p0)
    }
    public func getValue(): Int8 {
        this.value
    }
}
