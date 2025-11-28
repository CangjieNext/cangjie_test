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
    public func foo(p0: Int8, p1: Int16, p2: Int32, p3: Int64, p4: UInt8, p5: UInt16, p6: UInt32, p7: UInt64,
        p8: Float32, p9: Float64, p10: Bool): Unit {
        println("A.foo")
        println("p0 = ${p0}")
        println("p1 = ${p1}")
        println("p2 = ${p2}")
        println("p3 = ${p3}")
        println("p4 = ${p4}")
        println("p5 = ${p5}")
        println("p6 = ${p6}")
        println("p7 = ${p7}")
        println("p8 = ${p8}")
        println("p9 = ${p9}")
        println("p10 = ${p10}")
    }
    public func bar(p0: Int8, p1: Int16): Unit {
        println("A.foo")
        println("p0 = ${p0}")
        println("p1 = ${p1}")
    }
}
