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
    public static func foo(p0: Bool): Unit {
        println("A.foo(${p0})")
    }
    public static func foo(p0: Int16, p1: IntNative): Unit {
        println("A.foo(${p0}, ${p1})")
    }
    public static func foo(p0: UInt8, p1: UInt16, p2: UInt32, p3: UInt64, p4: UIntNative): Unit {
        println("A.foo(${p0}, ${p1}, ${p2}, ${p3}, ${p4})")
    }
}
