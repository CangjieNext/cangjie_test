/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

interface I04 {
    func bar<T>(a: T): Unit
}

abstract class Base04 {
    public open func f3<T>(a: T, b: I04): I04 where T <: I04
}

class Sub04 <: Base04 {
    public func f3<X>(a: X, b: I04): I04 where X <: I04 {
        a
        return b
    }
}
var xxx = ""
var yyy =''