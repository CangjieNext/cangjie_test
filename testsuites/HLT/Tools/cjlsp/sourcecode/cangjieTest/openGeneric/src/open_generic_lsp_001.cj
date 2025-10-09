/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

interface Bar01 {
    func bar<T>(a: T): Unit
}

abstract class Foo01 {
    public func foo<T>(a: T): Unit
    public open func goo<T>(a: T): Unit { a }
}