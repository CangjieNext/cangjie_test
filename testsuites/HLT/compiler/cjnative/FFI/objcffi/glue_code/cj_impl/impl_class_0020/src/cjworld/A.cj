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
    public A(public let value: Int64) {}
    public static func foo(value: Int64): A {
        println("A.foo")
        A(value)
    }
    public func getValue(): Int64 {
        this.value
    }
}
