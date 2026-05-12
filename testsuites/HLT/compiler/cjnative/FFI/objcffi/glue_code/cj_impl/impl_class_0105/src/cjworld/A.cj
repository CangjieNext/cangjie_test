/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public open class A {
    public init() {
        println("in cj1")
    }
    public init(p1: Int64) {
        println("in cj2, ${p1}")
    }
    public init(p1: Float32, p2: Float64) {
        println("in cj, ${p1}, ${p2}")
    }
    public init(p1: Int8, p2: Int16, p3: Int32, p4: IntNative) {
        println("in cj, ${p1}, ${p2}, ${p3}, ${p4}")
    }
    public init(p0: Bool, p1: UInt8, p2: UInt16, p3: UInt32, p4: UInt64, p5: UIntNative) {
        println("in cj, ${p0}, ${p1}, ${p2}, ${p3}, ${p4}, ${p5}")
    }
}
