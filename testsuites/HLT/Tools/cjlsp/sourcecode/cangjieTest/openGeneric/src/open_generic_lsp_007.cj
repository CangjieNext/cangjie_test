/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

open class Base07 {
    protected open func f1<U>(b: U): Unit where U <: ToString {}
}

class Sub07 <: Base07 {
    protected override func f1<T1, T2>(b: T2): Unit where T1 <: ToString {}
}
