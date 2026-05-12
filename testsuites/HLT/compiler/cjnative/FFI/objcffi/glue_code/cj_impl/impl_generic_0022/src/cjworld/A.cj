/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import interoplib.objc.*

public struct A<T> where T <: ToString {
    private var v: T
    public init(a: T) {
        var b: T = a
        v = b
        println("in cj, ${v}")
    }
    public prop p: Int64 {
        get() {
            var b: T = v
            1
        }
    }
    public func f(): Int64 {
        var b: T = v
        1
    }
}
