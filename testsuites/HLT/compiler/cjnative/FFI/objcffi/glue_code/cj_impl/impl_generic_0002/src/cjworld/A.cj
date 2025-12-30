/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import interoplib.objc.*

public open class A<T> where T <: ToString {
    public var v: T
    public init(a: T) {
        var b: T = a
        v = b
        println("in cj, ${v}")
    }
    protected init(a: T, b: T) {
        v = b
        println("in cj, ${a}")
        println("in cj, ${b}")
    }
    public open func f1(a: T): T {
        var b: T = a
        b
    }
    protected open func f2(a: T): T {
        var b: T = a
        b
    }
}
