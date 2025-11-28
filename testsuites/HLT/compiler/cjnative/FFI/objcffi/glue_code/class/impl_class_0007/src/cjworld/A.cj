/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*
import std.math.*
import std.math.numeric.*

public class A {
    public func foo(p0: Int8, p1: Int16, p2: Int32, p3: Int64, p4: UInt8, p5: UInt16, p6: UInt32, p7: UInt64,
        p8: Float32, p9: Float64, p10: Bool): Unit {
        println("A.foo")
        println("p0 = ${p0 == Int8.Max}")
        println("p1 = ${p1 == Int16.Max}")
        println("p2 = ${p2 == Int32.Max}")
        println("p3 = ${p3 == Int64.Max}")
        println("p4 = ${p4 == UInt8.Max}")
        println("p5 = ${p5 == UInt16.Max}")
        println("p6 = ${p6 == UInt32.Max}")
        println("p7 = ${p7 == UInt64.Max}")
        println("p8 = ${p8 > 0.0}")
        println("p9 = ${p9 > 0.0}")
        println("p10 = ${p10 == true}")
    }
    public func bar(p0: Int8, p1: Int16, p2: Int32, p3: Int64, p4: UInt8, p5: UInt16, p6: UInt32, p7: UInt64,
        p8: Float32, p9: Float64, p10: Bool): Unit {
        println("A.bar")
        println("p0 = ${p0 == Int8.Min}")
        println("p1 = ${p1 == Int16.Min}")
        println("p2 = ${p2 == Int32.Min}")
        println("p3 = ${p3 == Int64.Min}")
        println("p4 = ${p4 == UInt8.Min}")
        println("p5 = ${p5 == UInt16.Min}")
        println("p6 = ${p6 == UInt32.Min}")
        println("p7 = ${p7 == UInt64.Min}")
        println("p8 = ${p8 == false}")
        println("p9 = ${p9 == 0.0}")
        println("p10 = ${p10 == 0.0}")
    }
}
