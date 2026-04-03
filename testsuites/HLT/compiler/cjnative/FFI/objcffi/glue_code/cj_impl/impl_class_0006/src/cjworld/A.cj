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
    public let value: Int8
    public let valueN: IntNative
    public let valueUN: UIntNative
    public init(value: Int8) {
        println("A.init")
        println("value = ${value}")
        this.value = value
        this.valueN = 128
        this.valueUN = 129
    }
    public init(p0: IntNative, p1: UIntNative) {
        println("A.init(${p0}, ${p1})")
        this.value = 123
        this.valueN = p0
        this.valueUN = p1
    }
    public func foo(p0: Int8): A {
        println("A.foo")
        println("p0 = ${p0}")
        A(p0)
    }
    public func getValue(): Int8 {
        this.value
    }
    public func getValueN(p0: IntNative): IntNative {
        println("CJ: getValueN(${p0})")
        this.valueN
    }
    public func getValueUN(p0: UIntNative): UIntNative {
        println("CJ: getValueUN(${p0})")
        this.valueUN
    }
}
