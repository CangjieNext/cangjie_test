/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import interoplib.objc.*

public enum A<T> where T <: ToString {
    | E(T)
    public prop p: Int64 {
        get() {
            var b: T
            1
        }
    }
    public func f(a: T): T {
        var b: T = a
        b
    }
}
