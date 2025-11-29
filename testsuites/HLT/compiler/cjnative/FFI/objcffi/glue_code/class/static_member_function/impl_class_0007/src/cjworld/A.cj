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
    public static func foo(p0: Int8, p1: Int16, p2: Int32, p3: Int64, p4: UInt8, p5: UInt16, p6: UInt32, p7: UInt64,
        p8: Float32, p9: Float64, p10: Bool): Unit {
        println("A.foo p0 = ${p0 == Int8.Max}")
        println("A.foo p1 = ${p1 == Int16.Max}")
        println("A.foo p2 = ${p2 == Int32.Max}")
        println("A.foo p3 = ${p3 == Int64.Max}")
        println("A.foo p4 = ${p4 == UInt8.Max}")
        println("A.foo p5 = ${p5 == UInt16.Max}")
        println("A.foo p6 = ${p6 == UInt32.Max}")
        println("A.foo p7 = ${p7 == UInt64.Max}")
        println("A.foo p8 = ${p8 > 0.0}")
        println("A.foo p9 = ${p9 > 0.0}")
        println("A.foo p10 = ${p10 == true}")
    }
    public static func bar(p0: Int8, p1: Int16, p2: Int32, p3: Int64, p4: UInt8, p5: UInt16, p6: UInt32, p7: UInt64,
        p8: Float32, p9: Float64, p10: Bool): Unit {
        println("A.bar p0 = ${p0 == Int8.Min}")
        println("A.bar p1 = ${p1 == Int16.Min}")
        println("A.bar p2 = ${p2 == Int32.Min}")
        println("A.bar p3 = ${p3 == Int64.Min}")
        println("A.bar p4 = ${p4 == UInt8.Min}")
        println("A.bar p5 = ${p5 == UInt16.Min}")
        println("A.bar p6 = ${p6 == UInt32.Min}")
        println("A.bar p7 = ${p7 == UInt64.Min}")
        println("A.bar p8 = ${p8 > 0.0}")
        println("A.bar p9 = ${p9 > 0.0}")
        println("A.bar p10 = ${p10 == false}")
    }
}
