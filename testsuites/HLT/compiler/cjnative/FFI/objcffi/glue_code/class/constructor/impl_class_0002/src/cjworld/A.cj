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
    public init() {

    }
    public func foo(p0: B): Int64 {
        print("A.foo\n", flush: true)
        p0.v
    }
}

public class B {
    public B(public let v: Int64) {}
}
