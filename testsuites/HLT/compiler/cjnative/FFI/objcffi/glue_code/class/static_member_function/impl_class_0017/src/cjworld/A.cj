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
    public static func foo() {
        println("A.foo")
    }
    public static func foo(p0: Bool, p1: Float32, p2: Int8) {
        println("A.foo(${p0},${p1},${p2})")
    }
    public static func foo(p0: Int32, p1: Float64) {
        println("A.foo(${p0},${p1})")
    }
}
