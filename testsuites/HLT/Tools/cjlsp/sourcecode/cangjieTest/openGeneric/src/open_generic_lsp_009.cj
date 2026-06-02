/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

open class Base09 {
    protected open func f1<U, T>(b: U): Unit where U <: ToString {}
}

class Sub09 <: Base09 {
    protected func f1<U1, T1>(b: U1): Unit where T1 <: ToString {}
}
