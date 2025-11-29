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
    public let v: Int64 = 123
    public init() {
        println("A.init")
    }
    public func foo(p0: A): Int64 {
        println("A.foo")
        p0.v
    }
}
