/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import interoplib.objc.*

public class A<T, K, V> where T <: ToString, K <: ToString, V <: ToString {
    public init(a: T, b: K, c: V) {
        println("in cj, ${a}")
        println("in cj, ${b}")
        println("in cj, ${c}")
    }
    public func f1(a: T, b: V, c: K): T {
        a
    }
    public func f2(a: V, b: K, c: T): K {
        b
    }
    public func f3(a: K, b: T, c: V): V {
        c
    }
}
