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
    public A(public let value: Int64) {
        println("A.A ${value}")
    }
    public init() {
        println("A.init")
        this.value = 123
    }
    public init(p0: Bool, p1: Float32, p2: Int8) {
        println("A.init(${p0},${p1},${p2})")
        this.value = 123
    }
    public init(p0: Int32, p1: Float64) {
        println("A.init(${p0},${p1})")
        this.value = 123
    }
}
