/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

interface I03 {
    func bar<T>(a: T): Unit
}

abstract class Base03 {
    public func f3<T>(a: T, b: I03): I03 where T <: I03
}

class Sub03 <: Base03 {
    public func f3<T>(a: T, b: I03): I03 where T <: I03 {
        a
        return b
    }
}
