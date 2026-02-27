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
    public let a: A
    public init() {
        println("B.init")
        this.a = A()
    }
    public func foo(): Unit {
        println("B.foo")
        this.a.foo()
    }
}
